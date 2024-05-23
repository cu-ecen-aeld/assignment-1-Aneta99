#!/bin/bash

# example invocation : ./finder.sh /git/test linux

# path to a directory on the filesystem
filesdir=$HOME$1
# text string which will be searched within these files
searchstr=$2
if [ "$#" -ne 2 ]
  then
    echo "Invalid number of arguments"
    exit 1
fi
# echo "$filesdir"
if [ -d "$filesdir" ]; then
  xval=$(find "$filesdir" -type f | wc -l)
  # c option passed to the grep to count the number of times the pattern appears, r recursive
  yval=$(grep -rc "$searchstr" "$filesdir" | wc -l)
  echo "The number of files are "$xval" and the number of matching lines are "$yval""
  exit 0
else
    echo "Directory does not exists"
    exit 1
fi
