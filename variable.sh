#!bin/bash

FIRST_NAME=$1;
SECOND_NAME=$2;

echo "check your details $FIRST_NAME  , $SECOND_NAME"

DATE=$(date)

echo "the time today is: ${DATE}"
 
 read USERNAME 
 echo "enter username: ${USERNAME}"
  read PASSWORD
  echo "enter password: ${PASSWORD}"

   echo "checking whether it takes or not "

  echo -n "give ur mobile number"
  read mobilenumber

  echo -n "enter adhaar number"
  read -s adhaar number
 
