#!/bin/bash

# Dependencies:
# - None

# Decompress a tarball
# @var $1 	The tarball name

function untar
{
  tar -zxvf $1
}