# Diff branch listings

alias branchdiff="git branch -vv | cut -c 3- | awk '$3 !~/\\[/ { print $1 }'"