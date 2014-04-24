#!/bin/bash

eval homedir=~
file=$homedir'/Dropbox/homeip.txt'
sleeptime=30

ip=''
oldip=''
date=''

function getIP() {
  curl -s icanhazip.com
}

while true; do
  sleep $sleeptime

  ip=$(getIP)
  date=$(date)

  if [ "$ip" != "$oldip" ]
  then
    echo "Writing IP: "$ip
    oldip=$ip
    echo -e $ip'\n'$date > $file
  fi
done
