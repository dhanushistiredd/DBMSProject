function getMatchDetailsAndMoreInfo() {
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
                // Fetch additional info
                fetchAdditionalInfo(data.id);
            }
        })
        .catch(error => console.error('Error:', error));
}

function fetchAdditionalInfo(matchId) {
    fetch(`/batsman/${matchId}`)
        .then(response => response.json())
        .then(batsmanData => {
            // Display batsman scores
            const additionalInfo = document.getElementById('additionalInfo');
            additionalInfo.innerHTML = `
                <h2>Batsman Scores</h2>
                <ul>
                    ${batsmanData.map(player => `<li>${player.player_name}: ${player.runs_scored} runs (${player.balls_faced} balls)</li>`).join('')}
                </ul>
            `;
        })
        .catch(error => console.error('Error:', error));
        // Assuming there's a button with class "more-info-btn" for each match
const moreInfoButtons = document.querySelectorAll('.more-info-btn');

moreInfoButtons.forEach(button => {
    button.addEventListener('click', async () => {
        const matchId = button.dataset.matchId;

        try {
            const battingScoresResponse = await fetch(`/getBattingScores?matchId=${matchId}`);
            const battingScoresData = await battingScoresResponse.json();
            const battingScores = battingScoresData.map(score => `${score.player_name}: ${score.runs_scored} runs (${score.balls_faced} balls)`);

            const bowlingFiguresResponse = await fetch(`/getBowlingFigures?matchId=${matchId}`);
            const bowlingFiguresData = await bowlingFiguresResponse.json();
            const bowlingFigures = bowlingFiguresData.map(figure => `${figure.player_name}: ${figure.overs_bowled} overs, ${figure.runs_conceded} runs, ${figure.wickets} wickets`);

            // Display batting scores and bowling figures in a modal or popup
            alert(`Batting Scores:\n${battingScores.join('\n')}\n\nBowling Figures:\n${bowlingFigures.join('\n')}`);
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    });
});


    fetch(`/bowling/${matchId}`)
        .then(response => response.json())
        .then(bowlingData => {
            // Display bowling figures
            const additionalInfo = document.getElementById('additionalInfo');
            additionalInfo.innerHTML += `
                <h2>Bowling Figures</h2>
                <ul>
                    ${bowlingData.map(player => `<li>${player.player_name}: ${player.overs_bowled} overs, ${player.runs_conceded} runs, ${player.wickets} wickets</li>`).join('')}
                </ul>
            `;
        })
        .catch(error => console.error('Error:', error));
}
