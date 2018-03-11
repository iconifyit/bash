#!/bin/bash

# Dependencies:
# - None

# Get rid of Mac hidden files

function unmac
{
  tr '\r' '\n' <$1 >$1.new;
  sudo rm -f $1;
  sudo mv $1.new $1
  for i in `find . -regex '.*\._.*'`; do sudo rm $i; echo "removing $i"; done
  sudo find . -name *.DS_Store -type f -exec rm {} \;
}