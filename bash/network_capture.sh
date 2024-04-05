#!/bin/bash

# Run using: ./capture.bash ip_address port filename


# SHOULD CHECK HERE TO SEE IF tshark is installed and in PATH

# Start tshark capture in background
tshark -i en0 -I -y IEEE802_11_RADIO -f udp -w ${3}.pcap -q &

sleep 0.5s

# Start 10sec iperf client capture, store results to disk
iperf -c ${1} -p ${2} -u -b 750M -t 10s | tee ${3}.iperf

# When iperf client capture ends, end tshark capture
kill %1

sleep 0.1s

echo "Capture complete."
