#!/bin/bash

channel=1
essid='old-spock'
apmac=$1

if [ -z $1 ] ; then
    echo "Usage: ap-crack.sh <apmac> <wep/wpa>"
else
    case "$2" in
	wpa)
	    aircrack-ng -b ${apmac} output*.cap
	    aircrack-ng -w ../dict/dic -0 ../output/output*.cap -l key.txt -a 2
	    echo "Stop dump once we find a handshake.."
	;;
	wep)
	    aircrack-ng -b ${apmac} ../output/output*.cap
	;;
    esac
fi
