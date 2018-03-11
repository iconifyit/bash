#!/bin/bash

# Dependencies
# ./vars.sh

# This function will make a backup of the contents of the current directory
# then delete all of its contents.

function makebackup
{
  pwd > /tmp/x
  awk -F/ '{print $NF}' /tmp/x > /tmp/y
  mydir=`cat /tmp/y`
  date >/tmp/x
  sed 's/  / /g' /tmp/x>/tmp/y
  sed 's/:/./g' /tmp/y>/tmp/x
  sed 's/ /./g' /tmp/x>/tmp/y
  awk -F. '{print $8 "." $2 "." $3 "." $4 $5}' /tmp/y>/tmp/x
  mydate=`cat /tmp/x`
  TARBALL=$mydir.$mydate
  date > /tmp/version.txt
  sudo cp /tmp/version.txt .
  echo "  Beginning the tar..."
  for i in `find . -regex '.*\._.*'`; do sudo rm $i; echo "removing $i"; done
  sudo find . -name *.DS_Store -type f -exec rm {} \;
  sudo tar -cf $TARBALL.tar *
  echo "  Gzipping the tarball..."
  sudo gzip $TARBALL.tar
  echo "  Moving $TARBALL.tar.gz to $BACKUPDIR..."
  sudo mv $TARBALL.tar.gz $BACKUPDIR
}