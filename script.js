function getMatchDetails() {
    const matchNumber = document.getElementById('matchNumber').value;
    fetch(`/match/${matchNumber}`)
        .then(response => response.json())
        .then(data => {
            const matchDetails = document.getElementById('matchDetails');
            if (data.error) {
                matchDetails.innerHTML = `<p>${data.error}</p>`;
            } else {
                matchDetails.innerHTML = `
                    <table>
                        <tr>
                            <th>Match Number</th>
                            <th>Team 1</th>
                            <th>Team 2</th>
                            <th>Stadium</th>
                            <th>Batting Figures</th>
                            <th>Bowling Figures</th>
                            <th>Result</th>
                        </tr>
                        <tr>
                            <td>${data.matchNumber}</td>
                            <td>${data.team1}</td>
                            <td>${data.team2}</td>
                            <td>${data.stadium}</td>
                            <td>${data.battingFigures}</td>
                            <td>${data.bowlingFigures}</td>
                            <td>${data.result}</td>
                        </tr>
                    </table>
                `;
            }
        })
        .catch(error => console.error('Error:', error));
}
