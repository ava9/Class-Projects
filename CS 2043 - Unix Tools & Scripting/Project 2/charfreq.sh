#!/bin/bash
find ./tweets -type f -name "*.txt" -exec wc -m {} \; | sort -g > charCount.txt
head -n 1 charCount.txt | sed -e 's/^[ \t]*//' | cut -d ' ' -f 1 > min_chars.txt
tail -n 1 charCount.txt | sed -e 's/^[ \t]*//' | cut -d ' ' -f 1 > max_chars.txt
rm -r charCount.txt

cd tweets
numchars="$(wc -m *.txt | tail -n 1 | sed -e 's/^[ \t]*//' | cut -d ' ' -f 1)"
numtweets="$(ls -l *.txt | wc -l)"
cd ../
echo $((numchars / numtweets)) > avg_chars.txt


