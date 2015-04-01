#!/bin/bash

#trim file
cat superbowl.html | tr [:space:] "\n" | tr [:punct:] "\n" | tr [:upper:] [:lower:] > trimed.html

#sort words and display top 100
cat trimed.html | grep -v "^\s*$" | sort | uniq -ci | sort -bnr | head -n 100

#remove temp file
rm -r trimed.html
