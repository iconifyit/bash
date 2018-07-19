#!/bin/bash

# Dependencies:
# - gpg

# Use FreeBSD ZIP instead of Mac ZIP for portability
# @var $1    The name of the zip file
# @return    Will move the resulting ZIP to the Desktop

function myzip
{
    if [ [-n $1] || [$1 == "-h]" ]; then
        echo " "
        echo "Usage: "
        echo " "
        echo "  Create a ZIP archive of all files in a directory."
        echo " "
        echo " Arguments:"
        echo " "
        echo " 1 = The name of the archive to create."
        echo " "
        echo " Default:"
        echo " "
        echo " NONE"
        echo " "
        return
    elseif
    fi
   
  for i in `find . -regex '.*\._.*'`; do sudo rm $i; echo "removing $i"; done
  sudo find . -name *.DS_Store -type f -exec rm {} \; 
    zip -r /tmp/$1 *
    mv /tmp/$1 ~/Desktop
}