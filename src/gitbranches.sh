#!/bin/bash

# Dependencies:
# - Requires git be installed and the current directory be an initialized git repo

# Pull all remote branches

function gitbranches
{
    git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done

}