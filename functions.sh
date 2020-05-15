#!/usr/bin/env bash

# Test if a variable is set. If so, return its value, or return a default value.
# Usage :
#
#    var1="foo"
#    var2="bar"
#    test=$(thisorthat "$var1" "$var2")
#    ~ $test == "foo"
#
#    var2="no var1 set"
#    test=$(thisorthat $var1 $var2)
#    ~ $test == "no var1 set"
function thisorthat() {

    local result="$2"
    if [ "$1" ]
    then
        local result="$1"
    fi
    echo $result

}

function rm_file_if_exists() {

    if [ -z "$1" ]
    then
        return null
    fi

    file="$1"
    if [ -f $file ] ; then
        rm $file
    fi
}

function bash_reload {
    source ~/.bash_profile
}


function aliases {
    ls /Users/scott/github/iconify/bash/aliases
}

function aka {
    ls /Users/scott/github/iconify/bash/aliases
}

function funcs {
    ls /Users/scott/github/iconify/bash/src
}

function funky {
   ls /Users/scott/github/iconify/bash/src
}

# Bloomreach functions
function br_build {
  mvn clean verify
}

function br_rebuild {
  mvn verify
}

function br_start {
  mvn -Pcargo.run -Drepo.path=storage
}

function bg_run {
  br_start
}

function br_debug {
  mvn -P cargo.run
}
