#!/bin/bash

channel=10
essid=$1
apmac=$2
mymac="00:11:22:33:44:55"

if [ -z $1 ] ; then
    echo "Usage: ap-poke-wep.sh <essid> <apmac>"
else
    airmon-ng start wlan0 $channel
    echo "Check for high percentage of packet returns..."
    aireplay-ng -9 -e $essid -a $apmac mon0

    sleep 3

    #fake auth
    #aireplay-ng -1 0 -e ${essid} -a ${apmac} -h ${mymac} mon0
#aireplay-ng -1 6000 -o 1 -q 10 -e ${essid} -a ${apmac} -h ${mymac} mon0
fi
