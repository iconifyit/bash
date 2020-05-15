#!/usr/bin/env bash

function zxpsign() {
    if [ -z "$1" ]
    then
        echo "You must provide a package name"
    else
        pkg="$1"
        /Applications/ccextensionsmac/ZXPSignCmd -sign $pkg ${pkg}.zxp selfDB.p12 Alias2Mocha7 -tsa https://timestamp.geotrust.com/tsa
    fi
}