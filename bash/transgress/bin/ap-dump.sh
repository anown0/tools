#!/bin/bash

apmac=$1
channel=$2

mymac='00:11:22:33:44:55'

if [ -z $1 ] ; then
    echo "Usage: ap-dump.sh <apmac> <channel>"
else
    echo "Start capture generated IVs..."
    airodump-ng -c $channel --bssid $apmac -w ../output/output mon0
fi
