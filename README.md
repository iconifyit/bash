# bash

This repository is a collection of bash scripts that I use regularly. Computers are made for programming and to simplify repetitive or difficult tasks. Many of these scripts are simply wrappers for commands I use often and don't care to try to memorize the syntax and arguments. 

## Structure

Each command is in a separate file and the filename matches the command name. Most of these do not require arguments but where they are needed, I have added comments indicating the arguments and type.

## How to Use

You can make use of these scripts by simply including the ./bash/main.sh file. It will glob the contents of ./bash/src/ for you.

In some instances, you may need to change some paths that are specific to my setup. I will eventually clean this up or at least place those workstation-specific paths in the vars.sh file and refer to them via symbols for easier updating. For now, you will have to figure that out on your own.
