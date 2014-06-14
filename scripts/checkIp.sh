#!/bin/bash

function getIP() {
  curl -s icanhazip.com
}

iplog=/tmp/iplog.txt
ip=$(getIP)
date=$(date)
file=${HOME}'/Dropbox/'${HOSTNAME}'ip.txt'

function writeNewIp() {
  echo "New IP"
  echo $ip
  # Save new ip in dropbox.
  echo -e $ip'\n'$date > $file
  # Save new ip to log file for comparison later
  echo $ip > $iplog
}

# If file doesn't exist this is probably the first time running the script.
if [ ! -f $iplog ]; then
  writeNewIp
elif [ "$ip" != "$(cat $iplog)" ]; then
  # IP has changed.
  writeNewIp
fi
