#!/bin/bash
match=$1
found=0
# show usage
[ $# -eq 0 ] && { echo "Usage: $0 fileName";exit 1; }
# try to find file in /etc
for f in /etc/*
do
  if [ $f == "$match" ]
  then
    echo "$match file found!"
    found=1
    break
  fi
done

#noop file not found
[ $found -ne 1 ] && echo "$match file not found in /etc directory"
