#!/bin/bash
find ./tweets -type f -name "*.txt" -exec wc -w {} \; | sort -g > wordCount.txt
head -n 1 wordCount.txt | sed -e 's/^[ \t]*//' | cut -d ' ' -f 1 > min_words.txt
tail -n 1 wordCount.txt | sed -e 's/^[ \t]*//' | cut -d ' ' -f 1 > max_words.txt
rm -r wordCount.txt

cd tweets
numwords="$(wc -w *.txt | tail -n 1 | sed -e 's/^[ \t]*//' | cut -d ' ' -f 1)"
numtweets="$(ls -l *.txt | wc -l)"
cd ../
echo $((numwords / numtweets)) > avg_words.txt


