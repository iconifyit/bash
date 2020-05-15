#!/usr/bin/env bash

function zipeach() {
	mkdir -p zips
    for f in *.eps
    do 
    	zip -r zips/${f##*/}.zip $f
    done
    cd zips
    rename '*.eps.zip' '.eps' ''
    rm *.eps.zip
    mv renamed/* .
    rmdir renamed
    cd ..
}