#!/bin/bash

# Dependencies:
# - Requires git be installed and the current directory be an initialized git repo

# Set the upstream for a local branch if it does not exist

function gitsetupstream {
    BRANCHNAME=`git rev-parse --abbrev-ref HEAD`
    if [[ $(git branch -r | grep -w "$BRANCHNAME" | wc -c) -ne 0 ]]; then
        echo "Branch $BRANCHNAME already has an upstream"
    else
        echo "Setting upstream for branch $BRANCHNAME"
        git push --set-upstream origin "$BRANCHNAME"
    fi
}