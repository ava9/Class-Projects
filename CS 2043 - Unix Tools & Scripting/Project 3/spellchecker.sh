#! /bin/bash 

#display use case for user
echo 'Example case : sh spellchecker.sh <input_file.txt>'
#trim file
cat $1 | tr [:space:] "\n" | tr [:punct:] "\n" > trimed.txt
#check file with dictionary
grep -x -f trimed.txt english.txt > checked.txt
#remove checked words and display
grep -v -w -f checked.txt trimed.txt
#remove files after use
rm -r trimed.txt
rm -r checked.txt
