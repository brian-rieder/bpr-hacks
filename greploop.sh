#!/bin/bash

# BPR: got tired of running multiple greps on the same two files...

# take files from command line
cmdline_in=$*
input_files=""
opt_flags=""

main() {
  # parse the command line input
  for cmdarg in $cmdline_in
  do
    # check for help -- will ironically (and intentionally) die if requested
    if [ "$cmdarg" == "-h" ] || [ "$cmdarg" == "--help" ]
    then
      display_help
    # process option flags
    elif [ "$cmdarg" == "-i" ] || [ "$cmdarg" == "-n" ]
    then
      opt_flags+="$cmdarg "
    # everything else gets to be a file, grep can handle those errors
    else
      input_files+="$cmdarg "
    fi
  done

  # if we don't want to exit, let's execute
  while [[ "$uinput" != "quitscript" ]] ; do
    read uinput
    # if we don't want to clear, run grep
    if [ "$uinput" != "clearscript" ] ; then
      grep --color $opt_flags $uinput $input_files
    # if requested, clear the output
    else
      printf "\033c" # ANSI escape, for those cygwin users with no "clear"
    fi
  done
}

display_help () {
  echo "greploop.sh -- by Brian Patrick Rieder (bpr)"
  echo "    Operates grep in a loop based on command line arguments."
  echo "Usage:"
  echo "    ./greploop.sh file.a file.b file.c ..."
  echo "          Any input followed by return will be piped into grep with requested flags."
  echo "          Input is taken in a loop until the program is stopped with ^C or 'quitscript'."
  echo "          Terminal output can be cleared with 'clearscript'"
  echo "Optional flags:"
  echo "     -i -- Run grep with case insensitivity"
  echo "     -n -- Run grep displaying line numbers"
  echo "This script was written because I got tired of running grep on the same files and can"
  echo "be reused or edited by anyone who desires to do so... it only took a few minutes to"
  echo "come up with and write anyways."
  exit 1
}

main
