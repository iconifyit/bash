#!/bin/bash

# Dependencies:
# - craic by George Flanagin

# Make a new strong password
#
# This function requires the `craic` binary written by George K. Flanagan
# If you are using Mac, you can use the function as-is. For Linux you will need 
# to change the body of the function to use the Linux words dictionary instead 
# of Mac's words dictionary:
#
#    /usr/local/bin/craic w9w9 -u -i /etc/linux.words -n 50 -m 12 > ~/Desktop/craic.txt
#
# The `w9w9` pattern tells craic the pattern to use for the password. This particuluar
# patters tells craic to create a password that is 'word-digit-word-digit'
# -n = number of passwords
# -m = password minimum length

function makepass
{
  craic w9w9 -u -i /usr/share/dict/words -n 50 -m 12 > ~/Desktop/craic.txt
}