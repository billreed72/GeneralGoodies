#!/bin/bash
while true; do
    read -p "Would you like to delete some files in this directory? " yn
    case $yn in
        [Yy]* ) read -p "Enter a search string to delete files: (i.e. *part-of-name*) " userInput
				echo "Files containing "$userInput" are being deleted now. ";
	            rm -fv $userInput;
				ls -lh; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
