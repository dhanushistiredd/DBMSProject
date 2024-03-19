const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const fs = require('fs');

const app = express();
const port = 3000;

const dbPath = 'C:\\Users\\dhanu\\Desktop\\DBMS project\\forms.db';
const sqlFilePath = 'C:\\Users\\dhanu\\Desktop\\DBMS project\\matches.sql';

// Check if the database file exists
if (!fs.existsSync(dbPath)) {
    // If database file doesn't exist, create a new one and initialize it
    const db = new sqlite3.Database(dbPath, (err) => {
        if (err) {
            console.error('Error opening database:', err.message);
        } else {
            // Read SQL commands from file and execute them
            const sqlCommands = fs.readFileSync(sqlFilePath, 'utf8');
            db.exec(sqlCommands, (err) => {
                if (err) {
                    console.error('Error executing SQL commands:', err.message);
                } else {
                    console.log('Database initialized successfully');
                }
            });
        }
    });
} else {
    console.log('Database already exists');
}

// Serve static files from the 'public' directory
app.use(express.static('public'));

// Fetch match details by match number from database
app.get('/match/:matchNumber', (req, res) => {
    const matchNumber = req.params.matchNumber;
    const db = new sqlite3.Database(dbPath);
    db.get('SELECT * FROM matches WHERE matchNumber = ?', [matchNumber], (err, row) => {
        if (err) {
            console.error('Database error:', err.message);
            res.status(500).send('Internal Server Error');
        } else if (!row) {
            res.status(404).send('Match not found');
        } else {
            res.json(row);
        }
    });
    db.close();
});

// Fetch batsman scores by match id from database
app.get('/batsman/:matchId', (req, res) => {
    const matchId = req.params.matchId;
    const db = new sqlite3.Database(dbPath);
    db.all('SELECT * FROM batsman_scores WHERE match_id = ?', [matchId], (err, rows) => {
        if (err) {
            console.error('Database error:', err.message);
            res.status(500).send('Internal Server Error');
        } else {
            res.json(rows);
        }
    });
    db.close();
});

// Fetch bowling figures by match id from database
app.get('/bowling/:matchId', (req, res) => {
    const matchId = req.params.matchId;
    const db = new sqlite3.Database(dbPath);
    db.all('SELECT * FROM bowling_figures WHERE match_id = ?', [matchId], (err, rows) => {
        if (err) {
            console.error('Database error:', err.message);
            res.status(500).send('Internal Server Error');
        } else {
            res.json(rows);
        }
    });
    db.close();
});

// Start the server
app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});
