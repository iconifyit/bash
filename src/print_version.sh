#!/bin/bash

# Dependencies:
# - ./getversion.sh

function print_version
{
  getversion
  $VERSION > version.txt
}