#!/usr/bin/env bash

# Dependencies:
#    thisdir.sh
#    slugify.sh
#    thisorthat.sh
#    bash_reload.sh

function aliasme() {

    # Set some default variables

    aliasdir="/Users/scott/github/iconify/bash/aliases/"

    if [ -e /tmp/x ]
    then
        rm /tmp/x
    fi
    dirname=`thisdir`
    slug="`slugify $dirname`"
    echo "$slug"
    here=`pwd`
    echo $here

    # Query user for preferred alias name

    default_name="$slug.sh"
    echo "Alias name: (${default_name}):"
    read aliasname

    aliasname=$(thisorthat "$aliasname" "$default_name")

    # Make sure the alias does not already exist

    aliasfile="${aliasdir}${aliasname}.sh"

    if [ -e "${aliasfile}" ]
    then
      echo "An alias named '${aliasname}' already exists. Please choose another name."
      if [ -e /tmp/x ]
      then
          rm /tmp/x
      fi
      return 1
    fi

    # Clean up after ourselves

    if [ -e /tmp/x ]
    then
        rm /tmp/x
    fi

    # Create the new alias file

    echo "alias ${aliasname}='cd ${here}'" > $aliasfile

    # Reload the scripts and aliases

    bash_reload
}