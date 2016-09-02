#!/bin/bash
# set an infinite loop
while :
do
  #statements
  clear
  # display menu
  echo "Server Name - $(hostname)"
  echo "---------------"
  echo "  MAIN - MENU  "
  echo "---------------"
  echo "1. Display data and time."
  echo "2. Display what users are doing."
  echo "3. Display network connections."
  echo "4. Exit"
  # get input from the users
  read -p "Enter your choice [ 1-4 ]" choice
  # make decision usring case
  case $choice in
    1)
      echo "Today is $(date)"
      read -p "Press [Enter] key to continue..." readEnterKey
      ;;
    2)
      w
      read -p "Press [Enter] key to continue..." readEnterKey
      ;;
    3)
      netstat -nat
      read -p "Press [Enter] key to continue..." readEnterKey
      ;;
    4)
      echo "Bye!"
      exit 0
      ;;
    *)
      echo "Error: Invalid option..."
      read -p "Press [Enter] key to continue..." readEnterKey
      ;;
  esac
done
