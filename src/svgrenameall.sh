#!/bin/bash

# Depenencies:
# - ./svgrename.sh

# Rename all SVG files in a folder

# Recursively rename all SVG files in folders and subfolders

function svgrenameall 
{
    workdir=${PWD}
    for dir in $workdir/*;
    do
        cd $dir
        rename
        cd $workdir
    done
}

# This is so I don't break other scripts that use the old name.

function renameall
{
  svgrenameall
}