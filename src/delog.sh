#!/usr/bin/env bash

function delog {
    find ~/Library/Logs/ -name "*.log" -type f -mtime +1 -exec rm -f {} \;
}