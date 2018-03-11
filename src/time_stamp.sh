#!/bin/bash

# Dependencies:
# - None

# Set $TIME_STAMP to current time stamp

function time_stamp 
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
  TIME_STAMP=$mydate
}

# Shorter alias for above

function ts 
{
  time_stamp
}