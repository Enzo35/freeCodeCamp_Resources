#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"
NUM_REGEX='^[0-9]+$'

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

if [[ $1 =~ $NUM_REGEX ]]
then
  ELEMENT_INFO=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
else
  ELEMENT_INFO=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1' OR name = '$1'")
fi

if [[ -z $ELEMENT_INFO ]] 
then
  echo "I could not find that element in the database."
  exit
fi

ELEMENT_ATOMIC_NUMBER=$ELEMENT_INFO
ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ELEMENT_ATOMIC_NUMBER")
ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ELEMENT_ATOMIC_NUMBER")
TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $ELEMENT_ATOMIC_NUMBER")
ELEMENT_TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")
ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ELEMENT_ATOMIC_NUMBER")
ELEMENT_MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ELEMENT_ATOMIC_NUMBER")
ELEMENT_BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ELEMENT_ATOMIC_NUMBER")

ELEMENT_SYMBOL=$(echo $ELEMENT_SYMBOL | sed 's/[[:blank:]]//g')

echo "The element with atomic number"$ELEMENT_ATOMIC_NUMBER" is"$ELEMENT_NAME" ("$ELEMENT_SYMBOL"). It's a"$ELEMENT_TYPE", with a mass of"$ELEMENT_MASS" amu."$ELEMENT_NAME" has a melting point of"$ELEMENT_MELTING_POINT" celsius and a boiling point of"$ELEMENT_BOILING_POINT" celsius."