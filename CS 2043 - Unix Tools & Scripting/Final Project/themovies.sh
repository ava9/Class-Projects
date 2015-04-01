#!/bin/bash

while true; 
do
	#clear screen
	clear
	
	#get file
	curl -s http://www.movies.com/rss-feeds/top-ten-box-office-rss > temp.RSS

	#open file
	x=$(cat temp.RSS)
	echo "$x" | sed -r -n 's/<title><!\[CDATA\[(.*)\]\]><\/title>/\1/p'
	
	#change delimiter
	IFS=$'\n'

	printf '\n'
	declare -a array
	
	#set array to descriptions
	array=($(echo "$x" | sed -r -n 's/<description><!\[CDATA\[(.*)\]\]><\/description>/\1/p' | sed 's/<[^>]*>//g'))

	#remove file
	rm -r temp.RSS

	#print arary
	read -p "Choose a movie (1-10) > "

	printf "\nMovie $REPLY \nSynopsis\n"
	printf '\n'
	printf "${array[$REPLY]}"
	printf '\n\n'
	printf "Press enter to return"
	printf '\n'
   
	read -p "Press 'control + c' to quit > "

done

