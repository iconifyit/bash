#!/bin/bash

# Depenencies:
# - none

# Rename all SVG files in a folder

function svgrename() 
{
    thisdir=${PWD##*/}
    a=1
    for i in *.svg; do
      new=$(printf "${PWD##*/}-%04d.svg" "$a") #04 pad to length of 4
      mv -- "$i" "$new"
      let a=a+1
    done
}
