#!/bin/bash
function mainMenu {
  mainAnswer=""
  while [ "$mainAnswer" != "x" ];do
    tput clear;tput cup 3 15;tput setaf 1;tput setab 7
    echo "Bill's Operations Shell System (BOSS)";tput sgr0
    tput cup 5 17;tput rev;echo 'Main Menu Heading';tput sgr0
    tput cup 7 17;echo '1. GAM Commands'
    tput cup 8 17;echo '2. Fringe Commands'
    tput cup 9 17;echo 'x. Quit the application'
    tput cup 10 17;tput bold;read -p "MM - Enter your choice [1-2 or x]" mainAnswer
    tput clear
      if [ "$mainAnswer" = "1" ]; then subMenu1
      elif [ "$mainAnswer" = "2" ]; then subMenu2
      elif [ "$mainAnswer" = "x" ];then break
      fi
    tput sgr0
  done }
function subMenu1 {
  sm1Answer=""
  while [ "$sm1Answer" != "x" ];do
    tput cup 3 15;tput setaf 1;tput setab 7
    echo "Bill's Operations Shell System (BOSS)";tput sgr0
    tput cup 5 17;tput rev;echo 'GAM Commands';tput sgr0
    tput cup 7 17;echo '1. Get Google Apps User Report'
    tput cup 8 17;echo '2. Calendar'
    tput cup 9 17;echo 'x. Main Menu'
    tput bold;tput cup 10 17;read -p "SM1 - Enter your choice [1-2 or x]:" sm1Answer
    tput clear
      if [ "$sm1Answer" = "1" ]; then getUserReport
      elif [ "$sm1Answer" = "2" ]; then tput cup 20; cal
      elif [ "$sm1Answer" = "x" ]; then mainMenu
      fi
    tput sgr0
  done }
function subMenu2 {
  sm2Answer=""
  while [ "$sm2Answer" != "x" ];do
    tput cup 3 15;tput setaf 1;tput setab 7
    echo "Bill's Operations Shell System (BOSS)";tput sgr0
    tput cup 5 17;tput rev;echo 'Fringe Commands';tput sgr0
    tput cup 7 17;echo '1. Get a List of Drive Files for a user'
    tput cup 8 17;echo '2. SM2 Option B'
    tput cup 9 17;echo 'x. Main Menu'
    tput bold;tput cup 10 17;read -p "SM2 - Enter your choice [1-2 or x]:" sm2Answer    
    tput clear
      if [ "$sm2Answer" = "1" ]; then getDriveFilesWithFringe
      elif [ "$sm2Answer" = "2" ]; then tput cup 20; cal
      elif [ "$sm2Answer" = "x" ]; then mainMenu
      fi
    tput sgr0
  done }
function getUserReport {
  tput bold;tput cup 12 17;read -p 'Enter a username or email address:' gAppsUser
  tput sgr0
  tput cup 14 17
    # Syntax: gam report users [todrive] [date <yyyy-dd-mm>] [user <email>] [filter <filter terms>] [fields <included fields>]
    python /Users/billreed/Desktop/Development/BOSS/appirio-dev1GAM/gam.py \
    report users \
    user $gAppsUser > UserReport.csv
  tput clear
  }
function getDriveFilesWithFringe {
  tput bold;tput cup 12 17;read -p "Enter a user's email address:" gAppsFringeUser
  tput sgr0
  tput cup 14 17
python /Users/billreed/Desktop/Development/BOSS/fringe/fringe-dev.py \
--api_id="937142619609@developer.gserviceaccount.com" \
--oauth=service-file \
--api_key="/Users/billreed/Desktop/Development/BOSS/fringe/EdgeOfSanity-Lunatic-privatekey.p12" \
--domain=appirio-dev1.com \
--printout=False \
--service=Drive.Files \
--action=list \
--connections=10 \
--prn=$gAppsFringeUser \
--parameters="q='me' in owners;fields=items(title)"
  rm "Drive.Files.appirio-dev1.com"
  tput clear
  }
mainMenu
