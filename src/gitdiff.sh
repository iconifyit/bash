# Git-related aliases

alias gitdiff="git branch -vv | cut -c 3- | awk '$3 !~/\\[/ { print $1 }'"