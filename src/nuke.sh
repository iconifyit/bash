#!/bin/bash

# Dependencies

# ./vars.sh
# ./makebackup.sh

# This function will make a backup of the contents of the current directory
# then delete all of its contents.

function nuke
{
  makebackup
  THISDIR=`pwd`
  echo "  Nuking $THISDIR..."
  sudo rm -R -f *
  echo "  Done."
}