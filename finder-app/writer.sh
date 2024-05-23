#!/bin/bash

# example invocation : ./writer.sh /git/test/myFile.txt linux

#set -e
handle_error() {
    echo "An error occurred in line $1"
    exit 1
}

trap 'handle_error $LINENO' ERR

# path to a file (including filename)
writefile=$HOME$1
# text string which will be written within this file
writestr=$2
if [ "$#" -ne 2 ]
  then
    echo "Invalid number of arguments"
    exit 1
fi

dirname="`dirname "${writefile}"`"
if [[ ! -e "$dirname" ]]; then
    mkdir -p "$dirname"

fi

if [ ! -f "$writefile" ]; then
    touch "$writefile"
fi

# overwrite an existing file and creating the path if it doesn’t exist
# use single > for overwrite
echo "$writestr" > "$writefile"
exit 0
