#!/bin/bash

#display use case for user
echo 'Example case : sh teamwords.sh <nbefore> <nafter>'
#display [nbefore words] (patriots|seahawks) [nafter words]
cat superbowl.html | egrep -i -o "(\w+ ){$1}(patriots|seahawks)( \w+){$2}"
