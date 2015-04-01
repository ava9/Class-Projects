#! /bin/bash

#display use case for user
echo 'Example case : sh songremix.sh <song1.txt> <song2.txt>'
#Alternate lines between two songs
paste -d '\n' $1 $2 > newsong.txt
#display song and its location for user
cat newsong.txt
echo '\n***check newsong.txt***'

