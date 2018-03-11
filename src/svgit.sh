#!/bin/bash

# Depenencies:
# - node 
# - svgo node module

# Run SVGO Node module on a folder of SVG fles

function svgit() 
{
    if [ -z "$1" ]; then
        echo "You must provide a folder name"
    else
        svgo -f $1 -o $1-svgo --pretty
    fi
}