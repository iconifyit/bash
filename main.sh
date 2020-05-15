#!/bin/bash

# Source all of the .sh files in ./src/

bash_folder=~/github/iconify/bash

source "$bash_folder/functions.sh"

src="$bash_folder/src"

if [ ! -z "$(ls -A $src)" ]
then
    n=0
    for f in $src/*.sh; do source $f; let "n++"; done
    echo "$n Shells sourced in $src"
fi

aliases="$bash_folder/aliases"

if [ ! -z "$(ls -A $aliases)" ]
then
    n=0
    for f in ${aliases}/*.sh; do source $f; let "n++"; done
    echo "$n Aliases sourced in $aliases"
fi

