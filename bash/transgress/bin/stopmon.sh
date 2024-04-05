#!/bin/bash

airmon-ng stop mon0
airmon-ng stop wlan0

modprobe -r iwlagn
modprobe iwlagn 
service network-manager stop
service network-manager start
