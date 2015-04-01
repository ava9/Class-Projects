#! /usr/bin/python

#display use case for user
print('Example case : python ereader.py [-n #someNumber] (n: next page, p: previous page, q: quit)')
print('User controls n: next page, p: previous page, q: quit (case sensative)')

import sys
import os
import hashlib
import re
import termios
import contextlib

#starting directory
startDirectory = os.getcwd()

#set current directory to home
os.chdir(os.path.expanduser("~")) 

#key listener setup - taken from http://stackoverflow.com/questions/11918999/key-listeners-in-python (as mentioned in piazza post)
@contextlib.contextmanager
def raw_mode(file):
	old_attrs = termios.tcgetattr(file.fileno())
    	new_attrs = old_attrs[:]
    	new_attrs[3] = new_attrs[3] & ~(termios.ECHO | termios.ICANON)
    	try:
        	termios.tcsetattr(file.fileno(), termios.TCSADRAIN, new_attrs)
        	yield
	finally:
        	termios.tcsetattr(file.fileno(), termios.TCSADRAIN, old_attrs)

#main method
def main():
#first part: open correct line number and display file
	#if ereader.py -n flag is given
	if len(sys.argv) >= 3:
        	numLines = int(sys.argv[2])
        	inputFile = sys.argv[3]
	#no flag is given
	else:
		inputFile = sys.argv[1]
		numLines = 40

    	#compute md5 hash
    	fileHash = hashlib.md5(inputFile).hexdigest()

	#first line of file
    	startLine = 0;
	
	# (md5 hash in .reader_rc)? 1 : 0
	exists = 0;
    
	#open ~/.reader_rc if it exists
    	if os.path.isfile('.reader_rc'):
		startFile = file('.reader_rc','r') 
		rcFile = startFile.readlines()

		#searuserInputrcFile for file hash
		for a in rcFile:
			if re.search(fileHash, a):

				#if found, startLine = rcFile line number
				startLine = int(re.split(',', a, maxsplit = 1) [1])
				exists = 1;

				#close file (improve efficieny)
				startFile.close() 

    	#create.reader_rc
	else:
		open('.reader_rc', 'w+').close()

	#hash not found
  	if exists == 0:
		#add hash to .reader_rc
		add = '\n'+ fileHash +','+ str(startLine)
		with open('.reader_rc','a') as f:
			f.write(add)
		f.close()

	#find text to display
    	display = open(startDirectory + "/" + inputFile,'r')
    	displayLines = display.readlines()
    	displayLinesTotal = len(displayLines)
    	display.close()

	#display text
	for a in range(startLine, (startLine + numLines), 1):
		print(displayLines[a])

#second part: key listener to change text displayed (process user input)

	# key listener
    	with raw_mode(sys.stdin):
        	try:
            		while True:
				#find text to display
				display = open(startDirectory + "/" + inputFile,'r')
				displayLines = display.readlines()
				display.close()
				userInput= sys.stdin.read(1)

				# if 'q' is pressed, quit				
				if userInput== 'q':
					break
					reader.close()

				# if 'n' is pressed, next page
				if userInput== 'n':

					if (startLine + numLines) >= displayLinesTotal:
						startLine = displayLinesTotal
				 	else:
						startLine = startLine + numLines; 

					#display text
				 	for a in range((startLine), (startLine + numLines), 1):
				 	       print(displayLines[a])

					#update .reader_rc
					currentFile = file('.reader_rc','r')
				    	rcFile = currentFile.readlines()
				    	currentFile = file('.reader_rc','w')

					for a in rcFile:
						if re.search(fileHash, a):
							currentFile.write(fileHash +','+ str(startLine) +'\n')
						else:
							currentFile.write(a)

				# if 'p' is pressed, previous page
				if userInput== 'p':

					if (startLine - numLines) < 0:
						startLine = 0;
					else:
						startLine = startLine - numLines

					#display text
					for a in range((startLine), (startLine + numLines), 1):
						print(displayLines[a])
					
					#update .reader_rc
					currentFile = file('.reader_rc','r')
				    	rcFile = currentFile.readlines()
				    	currentFile = file('.reader_rc','w')

					for a in rcFile:
						if re.search(fileHash, a):
							currentFile.write(fileHash +','+ str(startLine) +'\n')
						else:
							currentFile.write(a)

        	except (KeyboardInterrupt, EOFError):
          		pass

if __name__ == '__main__':
    main()
