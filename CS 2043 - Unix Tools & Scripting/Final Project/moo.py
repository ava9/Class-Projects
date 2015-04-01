#! /usr/bin/python

#import packages
import sys
import SocketServer
import socket
import random
import threading

# set up udp request handler
class MyUDPHandler(SocketServer.BaseRequestHandler):
	def handle(self):
                inputguess = self.request[0].strip().split(':')[1]
                socket = self.request[1]
                socket.sendto(guessReply(inputguess), self.client_address)
              
#make sure there are 4 input arguments
if len(sys.argv) < 4:
        sys.exit('Error: You entered less than 4 arguments')
if len(sys.argv) > 4:
        sys.exit('Error: You entered more than 4 arguments')
	
secretCode = sys.argv[1]
myPort = int(sys.argv[2])
opponentPort = int(sys.argv[3])
endGame= False

# server udp setup
server = SocketServer.UDPServer(("localhost", myPort), MyUDPHandler)

# client socket setup
client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
client.settimeout(1)

startValue = 1234

#guess message (input)
def guessMessage(inputGuess):
	returnValue = 'GUESS:'+ str(inputGuess)        
	return returnValue

#check guess with secretCode
def guessReply(inputguess):

	#continue game
        if inputguess != secretCode:
		bullsCount = 0
		cowsCount = 0
                for i in range(4):
                        if inputguess[i] == secretCode[i]:
                                bullsCount = bullsCount + 1
                        else:
				if inputguess[i] in secretCode:
	                                cowsCount = cowsCount + 1
                returnValue = str(bullsCount) + 'B' + str(cowsCount) + 'C'
		return returnValue                

	#win scenario
        else:
		global endGame
                endGame= True
                return 'WIN'

# guess and response loop
while not endGame:
	# send message
        client.sendto(guessMessage(startValue) + "\n", ("localhost", opponentPort))
        received = ''
        try:
		# print recieved message
                received = client.recv(1024)
                print received
	# timeout
        except socket.timeout:
                pass
	# game won - end
        if received == 'WIN':
                endGame= True
	# game not won - continue
        else:
                server.handle_request()

        startValue = startValue + 1

