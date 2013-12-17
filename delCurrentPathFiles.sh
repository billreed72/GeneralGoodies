#!/bin/bash
while true; do
    read -p "Ready to Delete some files? (y/n): " yn
    case $yn in
        [Yy]* ) read -p "Enter a search string to delete files (i.e. *part-of-name*): " userInput
	            rm -fv $userInput;ls -lh;
				echo "File names containing " $userInput " have been deleted. "; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer Y or N.";;
    esac
done
