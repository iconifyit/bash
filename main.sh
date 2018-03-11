#!/bin/bash

# Source all of the .sh files in ./src/

for f in ~/github/iconify/bash/src/*.sh; do source $f; echo "sourcing : $f"; done

echo "Shells sourced"