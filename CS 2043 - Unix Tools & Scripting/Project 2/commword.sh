#!/bin/bash
find ./tweets -type f -name "*.txt" -exec grep -oE '\w+' {} \; | sort | uniq -ci | sort -nr | head -n 10 > most_common.txt


paste -s ./tweets/* | tr [:space:] '\n' | sort | uniq -c -i | sort -n -r | head | sed -e 's/^[ \t]*//' | cut -d ' ' -f 2 > most_common.txt

