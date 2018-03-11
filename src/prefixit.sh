#!/bin/bash

# Depenencies:
# - None

# Prefix all filenames in a folder

function prefixit 
{
    if [ -z "$1" ]; then
        echo "You must provide a prefix"
    else
        for f in * ; do mv "$f" "$1-$f" ; done
    fi
}