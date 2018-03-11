#!/bin/bash

# Depenencies:
# - ./vars.sh

# Create clean icon package folder structure

function org() 
{
  mkdir 64px
  mkdir 128px
  mkdir 256px
  mkdir 512px
  mkdir 32px
  mkdir svg

  mv *@32* 32px/
  mv *@64* 64px/
  mv *@128* 128px/
  mv *@256* 256px/
  mv *@512* 512px/
  mv *.svg svg/
}