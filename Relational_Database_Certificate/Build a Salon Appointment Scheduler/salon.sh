#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {

  if [[ -z $1 ]]
  then
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  else
    echo -e "\n$1"
  fi

  SERVICES=$($PSQL "SELECT service_id, name FROM services;")

  echo "$SERVICES" | while read ID BAR NAME
  do
    echo "$ID) $NAME"
  done

  read SERVICE_ID_SELECTED

  # CHECK CHOICE
  SERVICE_CHOSEN=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
  if [[ -z $SERVICE_CHOSEN ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  fi

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # CHECK PHONE
  PHONE_RESULT=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  if [[ -z $PHONE_RESULT ]]
  then
      #ADD NUMBER CUSTOMER
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    if [[ -z $CUSTOMER_NAME ]]
    then
      MAIN_MENU "Name invalid, returning to main menu."
    fi

    NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")

  #ASK TIME
  echo -e "\nWhat time would you like your cut,$CUSTOMER_NAME?"
  read SERVICE_TIME

  APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
  if [[ -z $APPOINTMENT_RESULT ]]
  then
    MAIN_MENU "Time invalid, returning to main menu."
  fi

  echo -e "\nI have put you down for a$SERVICE_CHOSEN at $SERVICE_TIME,$CUSTOMER_NAME."

  exit
}

MAIN_MENU

: '
TABLES COLUMN

- customers
customer_id SERIAL PRIMARY KEY
phone VARCHAR(20) UNIQUE
name VARCHAR(60)

- appointments
appointment_id SERIAL PRIMARY KEY
customer_id FOREIGN KEY REFERENCES customers(customer_id)
service_id FOREIGN KEY REFERENCES services(service_id)
time VARCHAR(30)

- services
service_id SERIAL PRIMARY KEY
name VARCHAR(60)

TABLES ROWS

- services
cut
color
perm
style
trim
'