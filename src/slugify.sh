#!/usr/bin/env bash

function slugify() {
    if [ -z "$1" ]
    then
        echo "You must enter a string to slugify"
    else
        echo "$1" | awk '{print tolower($0)}' > /tmp/x
        sed -i "" "s/ /-/g" /tmp/x
        cat /tmp/x
    fi
}