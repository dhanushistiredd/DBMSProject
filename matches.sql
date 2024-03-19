-- Create a table to store match details
CREATE TABLE IF NOT EXISTS matches (
    id INTEGER PRIMARY KEY,
    matchNumber INTEGER,
    team1 VARCHAR(50),
    team2 VARCHAR(50),
    stadium VARCHAR(100),
    battingFigures VARCHAR(100),
    bowlingFigures VARCHAR(100),
    result VARCHAR(100)
);

-- Insert sample data for 20 matches
INSERT INTO matches (matchNumber, team1, team2, stadium, battingFigures, bowlingFigures, result)
VALUES
    (1, 'India', 'Australia', 'MCG', '300/5 (50 overs)', 'Australia 3/45 (10 overs)', 'India won by 50 runs'),
    (2, 'England', 'Pakistan', 'Lord', '270/8 (50 overs)', 'England 2/40 (10 overs)', 'Pakistan won by 3 wickets'),
    (3, 'South Africa', 'New Zealand', 'Wanderers Stadium', '260/6 (50 overs)', 'New Zealand 3/55 (10 overs)', 'South Africa won by 20 runs'),
    (4, 'West Indies', 'Sri Lanka', 'Kensington Oval', '290/4 (50 overs)', 'Sri Lanka 2/60 (10 overs)', 'West Indies won by 6 wickets'),
    (5, 'Australia', 'Pakistan', 'SCG', '320/4 (50 overs)', 'Pakistan 4/70 (10 overs)', 'Australia won by 100 runs'),
    (6, 'India', 'England', 'Eden Gardens', '280/7 (50 overs)', 'England 3/65 (10 overs)', 'India won by 30 runs'),
    (7, 'New Zealand', 'South Africa', 'Seddon Park', '240/9 (50 overs)', 'South Africa 2/50 (10 overs)', 'New Zealand won by 20 runs'),
    (8, 'Sri Lanka', 'West Indies', 'R Premadasa Stadium', '270/5 (50 overs)', 'West Indies 3/55 (10 overs)', 'Sri Lanka won by 5 wickets'),
    (9, 'Pakistan', 'Australia', 'Gaddafi Stadium', '300/6 (50 overs)', 'Australia 2/40 (10 overs)', 'Pakistan won by 4 wickets'),
    (10, 'England', 'India', 'The Oval', '290/8 (50 overs)', 'India 4/65 (10 overs)', 'England won by 2 wickets'),
    (11, 'South Africa', 'New Zealand', 'SuperSport Park', '280/7 (50 overs)', 'New Zealand 3/60 (10 overs)', 'South Africa won by 3 wickets'),
    (12, 'West Indies', 'Sri Lanka', 'Providence Stadium', '260/5 (50 overs)', 'Sri Lanka 2/50 (10 overs)', 'West Indies won by 50 runs'),
    (13, 'Australia', 'Pakistan', 'Brisbane Cricket Ground', '310/4 (50 overs)', 'Pakistan 3/70 (10 overs)', 'Australia won by 80 runs'),
    (14, 'India', 'England', 'M Chinnaswamy Stadium', '300/6 (50 overs)', 'England 4/55 (10 overs)', 'India won by 60 runs'),
    (15, 'New Zealand', 'South Africa', 'Basin Reserve', '270/8 (50 overs)', 'South Africa 2/40 (10 overs)', 'New Zealand won by 2 wickets'),
    (16, 'Sri Lanka', 'West Indies', 'Sinhalese Sports Club Ground', '280/5 (50 overs)', 'West Indies 3/70 (10 overs)', 'Sri Lanka won by 20 runs'),
    (17, 'Pakistan', 'Australia', 'Sharjah Cricket Stadium', '290/7 (50 overs)', 'Australia 4/60 (10 overs)', 'Pakistan won by 1 wicket'),
    (18, 'England', 'India', 'Old Trafford', '300/6 (50 overs)', 'India 3/50 (10 overs)', 'England won by 4 wickets'),
    (19, 'South Africa', 'New Zealand', 'Newlands', '280/7 (50 overs)', 'New Zealand 2/55 (10 overs)', 'South Africa won by 30 runs'),
    (20, 'West Indies', 'Sri Lanka', 'Queen Park Oval', '270/6 (50 overs)', 'Sri Lanka 3/65 (10 overs)', 'West Indies won by 3 wickets');

-- Create a table to store batsman scores
CREATE TABLE IF NOT EXISTS batsman_scores (
    id INTEGER PRIMARY KEY,
    match_id INTEGER,
    player_name VARCHAR(50),
    runs_scored INTEGER,
    balls_faced INTEGER
);

-- Insert sample data for batsman scores
INSERT INTO batsman_scores (match_id, player_name, runs_scored, balls_faced)
VALUES
    (1, 'Virat Kohli', 120, 100),
    (1, 'Rohit Sharma', 80, 70),
    (1, 'Steve Smith', 60, 50),
    (2, 'Joe Root', 100, 120),
    (2, 'Babar Azam', 90, 110),
    (2, 'David Malan', 50, 60),
    (3, 'Kane Williamson', 110, 100),
    (3, 'Quinton de Kock', 70, 80),
    (3, 'Faf du Plessis', 40, 60),
    (4, 'Chris Gayle', 150, 120),
    (4, 'Kusal Perera', 80, 90),
    (4, 'Angelo Mathews', 60, 70),
    (5, 'Aaron Finch', 170, 130),
    (5, 'Babar Azam', 90, 100),
    (5, 'David Warner', 80, 70),
    (6, 'Virat Kohli', 120, 100),
    (6, 'Joe Root', 80, 70),
    (6, 'Eoin Morgan', 70, 60),
    (7, 'Kane Williamson', 100, 90),
    (7, 'Quinton de Kock', 90, 80),
    (7, 'Faf du Plessis', 80, 70),
    (8, 'Chris Gayle', 150, 120),
    (8, 'Kusal Perera', 90, 100),
    (8, 'Angelo Mathews', 50, 60),
    (9, 'Aaron Finch', 170, 130),
    (9, 'Babar Azam', 90, 100),
    (9, 'David Warner', 80, 70),
    (10, 'Virat Kohli', 120, 100),
    (10, 'Joe Root', 80, 70),
    (10, 'Eoin Morgan', 70, 60),
    (11, 'Kane Williamson', 100, 90),
    (11, 'Quinton de Kock', 90, 80),
    (11, 'Faf du Plessis', 80, 70),
    (12, 'Chris Gayle', 150, 120),
    (12, 'Kusal Perera', 90, 100),
    (12, 'Angelo Mathews', 50, 60),
    (13, 'Aaron Finch', 170, 130),
    (13, 'Babar Azam', 90, 100),
    (13, 'David Warner', 80, 70),
    (14, 'Virat Kohli', 120, 100),
    (14, 'Joe Root', 80, 70),
    (14, 'Eoin Morgan', 70, 60),
    (15, 'Kane Williamson', 100, 90),
    (15, 'Quinton de Kock', 90, 80),
    (15, 'Faf du Plessis', 80, 70),
    (16, 'Chris Gayle', 150, 120),
    (16, 'Kusal Perera', 90, 100),
    (16, 'Angelo Mathews', 50, 60),
    (17, 'Aaron Finch', 170, 130),
    (17, 'Babar Azam', 90, 100),
    (17, 'David Warner', 80, 70),
    (18, 'Virat Kohli', 120, 100),
    (18, 'Joe Root', 80, 70),
    (18, 'Eoin Morgan', 70, 60),
    (19, 'Kane Williamson', 100, 90),
    (19, 'Quinton de Kock', 90, 80),
    (19, 'Faf du Plessis', 80, 70),
    (20, 'Chris Gayle', 150, 120),
    (20, 'Kusal Perera', 90, 100),
    (20, 'Angelo Mathews', 50, 60);

-- Create a table to store bowling figures
-- Create a table to store bowling figures
CREATE TABLE IF NOT EXISTS bowling_figures (
    id INTEGER PRIMARY KEY,
    match_id INTEGER,
    player_name VARCHAR(50),
    overs_bowled REAL,
    runs_conceded INTEGER,
    wickets INTEGER
);

-- Insert sample data for bowling figures
INSERT INTO bowling_figures (match_id, player_name, overs_bowled, runs_conceded, wickets)
VALUES
    -- Data for match 1
    (1, 'Mitchell Starc', 10, 50, 2),
    (1, 'Josh Hazlewood', 10, 55, 1),
    (1, 'Glenn Maxwell', 8, 40, 0),

    -- Data for match 2
    (2, 'James Anderson', 10, 60, 2),
    (2, 'Stuart Broad', 10, 65, 1),
    (2, 'Jofra Archer', 8, 50, 1),

    -- Data for match 3
    (3, 'Trent Boult', 10, 45, 3),
    (3, 'Tim Southee', 10, 55, 2),
    (3, 'Mitchell Santner', 8, 35, 0),

    -- Insert data for other matches similarly
    (4, 'Player 1', 10, 50, 3),
    (4, 'Player 2', 9, 40, 2),
    (4, 'Player 3', 8, 55, 1),
    (5, 'Player 4', 10, 60, 1),
    (5, 'Player 5', 9, 45, 2),
    (5, 'Player 6', 8, 35, 0),
    (6, 'Player 7', 10, 70, 3),
    (6, 'Player 8', 9, 55, 2),
    (6, 'Player 9', 8, 60, 1),
    (7, 'Player 10', 10, 65, 1),
    (7, 'Player 11', 9, 40, 2),
    (7, 'Player 12', 8, 50, 1),
    (8, 'Player 13', 10, 45, 3),
    (8, 'Player 14', 9, 55, 2),
    (8, 'Player 15', 8, 70, 1),
    (9, 'Player 16', 10, 60, 2),
    (9, 'Player 17', 9, 40, 1),
    (9, 'Player 18', 8, 50, 1),
    (10, 'Player 19', 10, 70, 3),
    (10, 'Player 20', 9, 55, 2),
    (10, 'Player 21', 8, 40, 1);

