#!/bin/bash

#trim file
cat frankenstein.txt | tr [:space:] "\n" | tr [:punct:] "\n" | tr [:upper:] [:lower:] > trimed.txt

#sort words and display top 100
cat trimed.txt | grep -v "^\s*$" | sort | uniq -c | sort -bn -r | grep -vf prepositions.txt | head -n 100

#remove temp file
rm -r trimed.txt
