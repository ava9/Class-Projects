#! /bin/bash

#find phone number format variations
grep -o '(*[[:digit:]]\{1,11\})*[ ().-]*[[:digit:]]\{1,11\}[ ().-]*[[:digit:]]\{1,11\}' phone-data.txt > phoneFormats.txt
#display phone number variations
cat phoneFormats.txt
#remove temp file
rm -r phoneFormats.txt
