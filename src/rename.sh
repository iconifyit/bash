#!/bin/bash

# Renames files using a pattern you provide and replacing a string
# Example: `rename 'icon___*.eps' 'icon___'`
function rename() {
	newdir='renamed'
	echo "Searching for ${pattern}"
	if [ -z "$1" ]
    then
        echo "You must provide a file pattern"
    else
    	if [ -z "$2" ]
    	then
    	    echo "You must provide a search string"
    	else
    		if [ -z "$3" ]
    		then
    		    replace=''
    		else
    		    replace="$3"
    		fi
    		pattern="$1"
			needle="$2"
            mkdir $newdir
		    for f in $pattern; do cp -- "$f" "${newdir}/${f/$needle/$replace}"; done
		fi
    fi
}