#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo "$($PSQL "TRUNCATE TABLE games, teams")"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $YEAR != "year" ]]
then
  # 1) Insert unique teams into teams table
  
  # Check if winning team already exists in db
  WINNER_TEAM="$($PSQL "SELECT * FROM teams WHERE name='$WINNER'")"
  # If winning team doesn't exist in db
  if [[ -z $WINNER_TEAM ]]
  then
  # Then insert winning team in db
    INSERT_WINNER="$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")"
    # If insertion successful, print success message
    if [[ $INSERT_WINNER == "INSERT 0 1" ]]
    then
      echo Inserted $WINNER successfully
    else 
      echo Failed to insert $WINNER
    fi
  else
    echo $WINNER already exists
  fi

  # Check if opposing team already exists in db
    OPPONENT_TEAM="$($PSQL "SELECT * FROM teams WHERE name='$OPPONENT'")"
  # If opposing team doesn't exist in db
  if [[ -z $OPPONENT_TEAM ]]
  then
  # Then insert opposing team in db
    INSERT_OPPONENT="$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")"
    # If insertion successful, print success message
    if [[ $INSERT_OPPONENT == "INSERT 0 1" ]]
    then
      echo Inserted $OPPONENT successfully
    else
      echo Failed to insert $OPPONENT
    fi
  else
    echo $OPPONENT already exists
  fi

  # 2) Insert full row of data into games table

  # Get team_ids for current game
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  
  # Insert data into games table
  INSERT_GAME="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"
  # Check if insertion successful
  if [[ $INSERT_GAME == "INSERT 0 1" ]]
  then
    echo Game data inserted successfully
  else
    echo Failed to insert game data
  fi
fi
done