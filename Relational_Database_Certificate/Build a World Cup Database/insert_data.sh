#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "TRUNCATE TABLE games, teams;")"

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR == "year" ]]
  then
    continue
  fi
  # ADD DATA TO TEAMS TABLE
  # ADD WINNER
  WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")"
  if [[ -z "$WINNER_ID" ]]
  then
    echo $WINNER_ID
    echo "$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")"
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")"
  fi
  # ADD OPPONENT
  OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")"
  if [[ -z "$OPPONENT_ID" ]]
  then
    echo $OPPONENT_ID
    echo "$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")"
    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")"
  fi
  # ADD DATA TO GAMES TABLE
  echo "$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")"
done

: '
-teams
team_id SERIAL
name VARCHAR(30) UNIQUE

-games
game_id SERIAL PRIMARY KEY
year INT NOT NULL
round VARCHAR(20) NOT NULL
winner_id INT NOT NULL FOREIGN KEY REFERENCES teams.team_id
opponent_id INT NOT NULL FOREIGN KEY REFERENCES teams.team_id
winner_goals INT NOT NULL
opponent_goals INT NOT NULL

'