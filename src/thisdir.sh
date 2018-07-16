#!/bin/bash

# Dependencies:
# - None

# Print just the directory name from PWD

function thisdir
{
  pwd  >/tmp/x
  STR=`cat /tmp/x`
  FN=`awk -F\/ '{print NF}' /tmp/x`
  DIR=$(echo $STR | cut -f$FN -d"/")
  echo $DIR
}