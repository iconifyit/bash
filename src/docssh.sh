#!/bin/bash

# Open a shell to a docker container

function docssh() {
    if [ -z "$1" ]
    then
        echo "You must enter a docker container name"
        return 1
    fi
    docker exec -it "$1"  /bin/bash
}
