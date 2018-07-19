#!/bin/bash

function up
{
  levels=${1:-1}
  while [ $levels -gt 0 ]; do
    cd ..
    levels=$(( --levels ))
  done
}