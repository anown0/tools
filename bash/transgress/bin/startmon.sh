#!/bin/bash

service network-manager stop
modprobe -r iwlagn
modprobe iwlagn "swcrypto=1" "disable_hw_scan=1"

airmon-ng stop wlan0
airmon-ng stop mon0
airmon-ng start wlan0

ifconfig mon0 down
macchanger --mac=00:11:22:33:44:55 mon0
ifconfig mon0 up

