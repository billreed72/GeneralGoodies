#!/bin/bash
#=================================================================
# INSTALLATION INSTRUCTIONS
#=================================================================
#   PART OF BOSS INSTALL
#   CREATE SYMLINKS TO REMOTE APPS
# ln -s /home/billreed/boss/appirio-dev1GAM/gam.py /home/billreed/boss/gam.py
# ln -s /home/billreed/boss/fringe/fringe-dev.py /home/billreed/boss/fringe-dev.py
# ln -s /home/billreed/boss/fringe/EdgeOfSanity-Lunatic-privatekey.p12 /home/billreed/boss/EdgeOfSanity-Lunatic-privatekey.p12
#=================================================================
# MAIN MENU
#=================================================================
## date format ##
NOW=$(date +"%F")
NOWT=$(date +"%T")

function mainMenu {
  mainAnswer=""
  while [ "$mainAnswer" != "x" ];do
    tput clear;tput cup 3 15;tput setaf 214;tput setab 256; tput rev; tput bold
    echo "Bill's Operations Shell System (BOSS)";tput sgr0
    tput cup 5 17;tput bold; tput setaf 0;tput setab 10;echo 'Main Menu';tput sgr0
    tput cup 7 17;echo '1. Fringe'
    tput cup 8 17;echo '2. GAM'
    tput cup 9 17;echo '3. PowerTools'
    tput cup 10 17;echo 'x. Quit'
    tput cup 11 17;tput bold;read -p "Main Menu: Enter your choice [1-2 or x]:" mainAnswer; tput sgr0
    tput clear
      if [ "$mainAnswer" = "1" ]; then fringeMenu
      elif [ "$mainAnswer" = "2" ]; then gamMenu
      elif [ "$mainAnswer" = "3" ]; then powerToolsMenu
      elif [ "$mainAnswer" = "x" ]; then break
      elif [ "$mainAnswer" = "X" ]; then break
      fi
    tput sgr0
  done }
#=================================================================
# GAM MENU
#=================================================================
function gamMenu {
  gamAnswer=""
  while [ "$gamAnswer" != "x" ];do
    tput clear;tput cup 3 15;tput setaf 214;tput setab 256
    echo "Bill's Operations Shell System (BOSS)";tput sgr0
    tput cup 5 17;tput rev;echo 'GAM Commands';tput sgr0
    tput cup 7 17;echo '1. Google Apps User Report (single user)'
    tput cup 8 17;echo '2. Google Apps User Report (ALL users)'
    tput cup 9 17;echo 'x. Main Menu'
    tput bold;tput cup 10 17;read -p "GAM Menu: Enter your choice [1-2 or x]:" gamAnswer
      if [ "$gamAnswer" = "1" ]; then getUserReport
      elif [ "$gamAnswer" = "2" ]; then getUserReportALL
      elif [ "$gamAnswer" = "x" ]; then mainMenu
      elif [ "$gamAnswer" = "X" ]; then mainMenu
      fi
    tput sgr0
  done }
#=================================================================
# FRINGE MENU
#=================================================================
function fringeMenu {
  fringeAnswer=""
  while [ "$fringeAnswer" != "x" ];do
    tput clear;tput cup 3 15;tput setaf 214;tput setab 256
    echo "Bill's Operations Shell System (BOSS)";tput sgr0
    tput cup 5 17;tput rev;echo 'Fringe Commands';tput sgr0
    tput cup 7 17;echo '1. List of Drive Files for a user'
    tput cup 8 17;echo '2. Display the calendar'
    tput cup 9 17;echo 'x. Main Menu'
    tput bold;tput cup 10 17;read -p "Fringe Menu: Enter your choice [1-2 or x]:" fringeAnswer
      if [ "$fringeAnswer" = "1" ]; then getDriveFilesWithFringe
      elif [ "$fringeAnswer" = "2" ]; then tput setaf 256; tput cup 20; cal; sleep 1; tput sgr0
      elif [ "$fringeAnswer" = "x" ]; then mainMenu
      elif [ "$fringeAnswer" = "X" ]; then mainMenu
      fi
    tput sgr0
  done }
#=================================================================
# POWERTOOLS MENU
#=================================================================
function powerToolsMenu {
  powerToolsAnswer=""
  while [ "$powerToolsAnswer" != "x" ];do
    tput clear;tput cup 3 15;tput setaf 214;tput setab 256
    echo "Bill's Operations Shell System (BOSS)";tput sgr0
    tput cup 5 17;tput rev;echo 'PowerTools Commands';tput sgr0
    tput cup 7 17;echo '1. WHAT IS YOUR FAVORITE COLOR? enter a number...'
    tput cup 10 17;echo 'x. Main Menu'
    tput bold;tput cup 19 17;read -p "PT - Enter your choice [1-? or x]:" powerToolsAnswer
      if [ "$powerToolsAnswer" > "0" ]; then tput setaf $powerToolsAnswer; tput cup 20; cal; sleep 1; tput sgr0
      elif [ "$powerToolsAnswer" = "x" ]; then mainMenu
      elif [ "$powerToolsAnswer" = "X" ]; then mainMenu
      fi
    tput sgr0
  done }
#=================================================================
# GAM FUNCTIONS
#=================================================================
function getUserReport {
  tput bold;tput cup 12 17;read -p 'Enter a username or email address:' gAppsUser
  tput sgr0
  tput cup 14 17
    python gam.py report users user $gAppsUser date 2014-01-21 > UserReport-$NOW-$NOWT.csv
  sleep 1
  tput clear
  }
#=================================================================
function getUserReportALL {
  GURAanswer=""
  while read -p "Do you want to continue (Y/N)?" GURAanswer; do
    case $GURAanswer in
      [Yy]* ) python gam.py report users user date 2014-01-21 > AllUsersReport-$NOW-$NOWT.csv; sleep 1; tput clear; break; gamMenu;;
      [Nn]* ) tput setaf 10;echo "You chose wisely. :-) "; sleep 1; tput sgr0; break; gamMenu;;
      * ) echo "Please answer yes or no!!";;
    esac
  done
  }
#=================================================================
# FRINGE FUNCTIONS
#=================================================================
function getDriveFilesWithFringe {
  tput bold;tput cup 12 17;read -p "Enter a user's email address:" gAppsFringeUser
  tput sgr0
  tput cup 14 17
  python fringe-dev.py --api_id="937142619609@developer.gserviceaccount.com" --oauth=service-file --api_key="EdgeOfSanity-Lunatic-privatekey.p12" --domain=appirio-dev1.com --printout=False --service=Drive.Files --action=list --connections=10 --prn=$gAppsFringeUser --parameters="q='me' in owners;fields=items(title)"
  rm "Drive.Files.appirio-dev1.com"
  sleep 1
  tput clear
  }
#=================================================================
mainMenu
