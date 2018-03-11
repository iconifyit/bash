#!/bin/bash

# Depenencies:
# - ./svgrename.sh

# Rename all SVG files in a folder

# Recursively rename all SVG files in folders and subfolders

function renameall() 
{
    workdir=${PWD}
    for dir in $workdir/*;
    do
        cd $dir
        rename
        cd $workdir
    done
}