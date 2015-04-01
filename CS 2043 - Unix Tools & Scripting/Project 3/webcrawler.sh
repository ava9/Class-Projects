#!/bin/bash

#get html file
curl http://www.cs.cornell.edu/courses/cs2043/2015sp/assignments/superbowl.html > temp.html

#scrap html tags
cat temp.html | sed '/<.*>/d' > superbowl.html

#remove temp file
rm -r temp.html
