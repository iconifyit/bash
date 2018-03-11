#!/bin/bash

# Dependencies:
# - None

# Create a tarball of the current folder

function tarit() 
{
  date >/tmp/x
  sed 's/  / /g' /tmp/x>/tmp/y
  sed 's/:/./g' /tmp/y>/tmp/x
  sed 's/ /./g' /tmp/x>/tmp/y
  awk -F. '{print $8 "." $2 "." $3 "." $4 $5 $6}' /tmp/y>/tmp/x
  VERS=`cat /tmp/x`
  date > build.txt

  pwd >/tmp/x
  STR=`cat /tmp/x`
  FN=`awk -F\/ '{print NF}' /tmp/x`
  DIR=$(echo $STR | cut -f$FN -d"/")

  if [ -f $DIR.$VERS.tar ]; then
    sudo rm -f $DIR.$VERS.tar
  fi

  if [ -f $DIR.$VERS.tar.gz ]; then
    sudo rm -f $DIR.$VERS.tar.gz
  fi

  echo 'Beginning the tar ....'
  sudo nice tar -cf $DIR.$VERS.tar *
  ls -l $DIR.$VERS.tar
  echo 'Beginning the zipping ....'
  sudo nice gzip $DIR.$VERS.tar

  ls -l $DIR.$VERS.tar.gz
}