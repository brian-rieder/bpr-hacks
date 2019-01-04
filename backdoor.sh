#!/bin/bash

# HOW TO:
# to use this script with an appropriately configured LAN PC, simply run this and a file '.backdoor_lock'
# will be created in the home directory of the PC who needs access. delete this file on the LAN PC when 
# access is needed and the "backdoor" will be open for the LAN PC ($lancomp) to access the destination
# URL ($desturl) on the specified port ($localhostport). 

# all this script really does is forward incoming traffic on whatever port you specify to whatever destination
# you specify

# note: you'll have to configure the PC who needs access with a host entry in ~/.ssh/config pointing
# to localhost on the desired port in addition to running this script.

desturl="github.com" # insert location that you need access to here
localhostport=1024 # insert the port that you're forwarding traffic through here
lancomp="scooby" # insert the hostname of the PC who needs access here

duration=300
while :
do
  ssh $ "touch .backdoor_lock"
  ssh scooby "while [ -f .backdoor_lock ] ; do sleep 2 ; done"

  echo "Opening backdoor for $duration seconds at $(date +%I:%M%p)..."
  ssh -R $localhostport:$desturl:22 $lancomp sleep 300

  if [ $? -eq 0 ]; then
    echo "Exiting due to duration timeout."
  else
    echo "Exiting..."
  fi
done
