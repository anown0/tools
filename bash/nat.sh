#!/bin/bash

#echo UID=$UID
#echo EUID=$EUID
#exit

if [ $UID -ne 0 ]
then
  exec sudo $0 "${@}"
fi


status() {
  /sbin/iptables -L
}

on() {
  echo 1 > /proc/sys/net/ipv4/ip_forward
  /sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
  /sbin/iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
  /sbin/iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
}

off() {
  echo 0 > /proc/sys/net/ipv4/ip_forward
  /sbin/iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
  /sbin/iptables -D FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
  /sbin/iptables -D FORWARD -i eth1 -o eth0 -j ACCEPT
}

help() {
  echo "$(basename $0) {on|off|status|help}"
}

case $1 in
  on|off|status) $1;;
  *) help
esac
