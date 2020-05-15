#!/bin/bash

# Dependencies:
# - Requires git be installed and the current directory be an initialized git repo

# Commit diversity avatars code
function dagit() {
  var=`pwd`
  echo $var
  if [[ $var = '/Users/scott/github/iconify/diversity.box/wordpress' ]]
  then
     echo "Pushing diversityavatars.com"
     git push development master
     git push github
  else
     echo "This script can only be run from /Users/scott/github/iconify/diversity.box/wordpress"
  fi
}