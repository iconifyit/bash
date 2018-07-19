#!/bin/bash

# Dependencies:
# - gpg

# Digitally sign a file
# @var $1    The file to sign

function sign 
{
  gpg -a -i -v --output $1.sig --detach-sign $1
}