import time
import sys
import logging
import os
import re
from clint.textui import colored
xAppName = colored.red("#     Bill's Information Manager     #")
xSpacer = "#------------------------------------#"
os.system('clear')
noAss = colored.yellow("This is where you can place your function for this option.")
exitMessage = colored.red("Exiting... Thanks for using this application.")
ValidEntry = (1|2|3|4)
#mainMenu function:
def mainMenu(list, question):
    for entry in list:
        print 1 + list.index(entry),
        print ") " + entry 
    return input(question) - 1
items = [colored.magenta("Google Apps Manager"),colored.magenta("PowerTools"),colored.magenta("Other"),colored.magenta("Exit")]
loop = 1
while loop == 1:
	os.system('clear')
	print colored.red(xSpacer)
	print xAppName
	print colored.red(xSpacer)
	print colored.white(xSpacer)
	print colored.cyan(xSpacer)
    	choice = mainMenu(items,colored.white("Please select an option:"))
    	if choice == 0:
			print noAss;time.sleep(0.5)
    	elif choice == 1:
			print noAss;time.sleep(0.5)
    	elif choice == 2:
			print noAss;time.sleep(0.5)
    	elif choice == 3:
    		print exitMessage;time.sleep(0.5)
    		break
    	elif choice != (1|2|3|4):
    		print 'I said make a VALID choice!!';time.sleep(1)
#    	elife choice != (ValidEntry):
#    		print 'you suck';time.sleep(1)
logging.basicConfig(format='[%(asctime)s]:[%(levelname)s]:%(message)s',filename = 'Adventure.log',level = logging.DEBUG)
logging.debug('This is a Debug message')
logging.info('This is an Info message')
logging.warning('This is a Warning message')
