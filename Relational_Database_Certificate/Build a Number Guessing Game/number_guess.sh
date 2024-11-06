#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
NUM_REGEX='^[0-9]+$'

#TRUNCATE=$($PSQL "TRUNCATE TABLE players;")

echo -e "\nEnter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT player_id FROM players WHERE name='$USERNAME';")
if [[ -z $USER_ID ]]
then
  NEW_USER=$($PSQL "INSERT INTO players (name, games_played, best_game) VALUES ('$USERNAME', 0, 1000);")
  USER_ID=$($PSQL "SELECT player_id FROM players WHERE name='$USERNAME';")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE player_id=$USER_ID;")
  BEST_GAME=$($PSQL "SELECT best_game FROM players WHERE player_id=$USER_ID;")
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

TARGET_NUMBER=$(( 1 + $RANDOM % 1000 ))
TRIES=1
echo -e "\nGuess the secret number between 1 and 1000:"

while true
do
  read GUESS
  if [[ $GUESS =~ $NUM_REGEX ]]
  then
    if (( $GUESS > $TARGET_NUMBER ))
    then
      echo -e "\nIt's lower than that, guess again:"
    elif (( $GUESS < $TARGET_NUMBER ))
    then
      echo -e "\nIt's higher than that, guess again:"
    else
      break
    fi
  else
    echo -e "\nThat is not an integer, guess again:"
  fi
  TRIES=$(( $TRIES + 1 ))
done

GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE player_id=$USER_ID;")
BEST_GAME=$($PSQL "SELECT best_game FROM players WHERE player_id=$USER_ID;")

GAMES_PLAYED=$(( $GAMES_PLAYED + 1 ))
UPDATE_RESULT=$($PSQL "UPDATE players SET games_played=$GAMES_PLAYED WHERE player_id=$USER_ID;")

if (( $BEST_GAME > $TRIES ))
then
  UPDATE_RESULT=$($PSQL "UPDATE players SET best_game=$TRIES WHERE player_id=$USER_ID;")
fi

echo -e "\nYou guessed it in $TRIES tries. The secret number was $TARGET_NUMBER. Nice job!"