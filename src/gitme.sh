#!/bin/bash

# Dependencies:
# - Requires git be installed and the current directory be an initialized git repo
# - ./gitsetupstream

# Add, commit, set-upstream, and push local branch

function gitme
{
    if [ -z "$1" ]
    then
        echo "You must enter a git commit message"
    else
        git status
        echo "Adding new files to track"
        git add *
        echo "commit -a -m \"$1\""
        git commit -a -m "$1"
        echo "Set the upstream branch to track if none exists"
        gitsetupstream
        echo "Push the updates to the remote origin"
        git push
    fi
}