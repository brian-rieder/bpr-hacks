#!/bin/bash

displayhelp=false
remotes=false
dates=false

while getopts ":hrd" opt; do
  case $opt in
        r)
          remotes=true
          ;;
        d) 
          dates=true 
          ;;
        h)
          displayhelp=true 
          ;;
        \?)
          echo "Invalid option: -$OPTARG" >&2 
          displayhelp=true
          ;;
  esac
done


if $displayhelp; then
  echo "Usage: ./branchlist.sh [OPTION]

  Lists the branches associated with the current git repository along with their
  last modified dates. Default behavior is to display local branches with the
  amount of time since they were last modified.

  Mandatory arguments to long options are mandatory for short options, too.
  -r   Display all remote branches instead of just local branches.
  -d   Display the modified dates instead of time since last modified.
  -h   Displays this help message."
else
  $remotes && refs="refs/remotes" || refs="refs/heads"
  $dates && datetype="iso8601" || datetype="relative"

  # run the command
  git for-each-ref --sort="-committerdate:$datetype" --format="%(committerdate:$datetype)%09%(refname:short)" $refs

fi
