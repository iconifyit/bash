#!/bin/bash

function gdiff
{
    if [ -z "$1" ]
    then
        echo "diffing checked-in files with current files."
        git diff --patience
    elif [ -z "$2" ]
    then
        echo "diffing $1 with current checked in files on this branch."
        git diff --patience "$1"
    else
        echo "diffing $1 with $2"
        git diff --patience "$1" "$2"
    fi
}