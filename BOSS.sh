#!/bin/bash
function mainMenu {
  mainAnswer=""
  while [ "$mainAnswer" != "x" ];do
    tput clear;tput cup 3 15;tput setaf 1;tput setab 7
    echo "Bill's Operations Shell System (BOSS)";tput sgr0
    tput cup 5 17;tput rev;echo 'Main Menu Heading';tput sgr0
    tput cup 7 17;echo '1. Sub Menu 1'
    tput cup 8 17;echo '2. Sub Menu 2'
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
    tput cup 5 17;tput rev;echo 'Sub Menu 1 Heading';tput sgr0
    tput cup 7 17;echo '1. Who?'
    tput cup 8 17;echo '2. Calendar'
    tput cup 9 17;echo 'x. Main Menu'
    tput bold;tput cup 10 17;read -p "SM1 - Enter your choice [1-2 or x]:" sm1Answer
    tput clear
      if [ "$sm1Answer" = "1" ]; then tput cup 20; who
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
    tput cup 5 17;tput rev;echo 'Sub Menu 2 Heading';tput sgr0
    tput cup 7 17;echo '1. SM2 Option A'
    tput cup 8 17;echo '2. SM2 Option B'
    tput cup 9 17;echo 'x. Main Menu'
    tput bold;tput cup 10 17;read -p "SM2 - Enter your choice [1-2 or x]:" sm2Answer    
    tput clear
      if [ "$sm2Answer" = "1" ]; then tput cup 20; who
      elif [ "$sm2Answer" = "2" ]; then tput cup 20; cal
      elif [ "$sm2Answer" = "x" ]; then mainMenu
      fi
    tput sgr0
  done }
mainMenu
