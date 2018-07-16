#!/bin/bash

# Source all of the .sh files in ./src/

src=~/github/iconify/bash/src
n=0
for f in $src/*.sh; do source $f; let "n++"; done

echo "$n Shells sourced in $src"