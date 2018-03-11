#!/bin/bash

# Dependencies:
# - Requires git be installed and the current directory be an initialized git repo

# Recursively commit & push including submodules

function gitall
{
    if [ -z "$1" ]
    then
        echo "You have to enter a git commit message"
    else
        git status
        git add *
        echo "commit -a -m \"$1\""
        git commit -a -m "$1"
        git push --all --recurse-submodules=on-demand -u
        # git push
    fi
}