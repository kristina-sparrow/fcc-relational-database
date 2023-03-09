#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, what would you like today?\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  # show available services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  # if no services available
  if [[ -z $SERVICES ]]
  then
    echo "Sorry, we don't have any services right now."
  else
    # show formatted services
    echo -e "$SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done
    # get customer choice
    read SERVICE_ID_SELECTED
    # if choice not a number
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "Sorry, that's not a valid number. Please choose a number."
    else
      VALID_SERVICE=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
      # if not a valid service
      if [[ -z $VALID_SERVICE ]]
      then
        # send to main menu
        MAIN_MENU "Sorry, I couldn't find that service. Please choose a valid service."
      else
        # request customer phone number
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        # check if existing customer
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        # if customer doesn't exist 
        if [[ -z $CUSTOMER_NAME ]]
        then
          # get customer name
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME
          # insert new customer
          CUSTOMER_INFO_INCLUSION=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
        fi
        # get service name
        SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
        # request appointment time
        echo "What time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
        read SERVICE_TIME
        # insert into appointment table
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        APPOINTMENT_INCLUSION=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
        echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
      fi
    fi
  fi
}

MAIN_MENU
