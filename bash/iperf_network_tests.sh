# This client-side script measures a few metrics for network connectivity performance
# using iperf utility. 
#

https://www.techtarget.com/searchnetworking/tip/How-to-use-iPerf-to-measure-throughput



# iperf -s must be run on the server
export SERVERIP="10.51.70.114"

# Port to be used, server anc client must be the same
export PORT="5001"

# The TCP window size is the amount of data that can be buffered during a connection 
# without a validation from the receiver, which can be between 2 and 65,535 bytes
# On Linux, the kernel allocates double as indicated

export WINDOWSIZE="256"

# test duration time (default is 10 sec) ( -t option )
export DURATION="3"

# Interval in seconds between periodic bandwidth reports ( -i option )
export INTERVAL="10" 

export PORT="5001"

# Maximum Segment Size (MSS) is the larget amount of data that can be supported in bytes( -M option )
# MSS = MTU - TCP and IP headers.  TCP and IP headers are 40 bytes
export MSS = "1300"

# Maximum Transmission Unit (MTU) is the greatest amount of data that can be transferred in a frame (-m).
# Here the MSS is not equal to 1500 - 40 but to 1500 - 40 - 12 (Timestamps option) = 1448

 
# Ping the server
#ping -c 2 ${SERVERIP}

echo "############### Checking Client to Server Bandwidth (TCP) ####################"
#iperf -c ${SERVERIP} -f m -w ${WINDOWSIZE} -p ${PORT}
echo " sleep..."
sleep 1

echo "###############      Bi-directional Bandwidth (TCP)       ####################"
#iperf -c ${SERVERIP} -f m -r -w ${WINDOWSIZE} -p ${PORT}
echo " sleep..."
sleep 1

echo "###############  Simultaneous Bi-directional Bandwidth (TCP) #################"
#iperf -c ${SERVERIP} -f m -d -w ${WINDOWSIZE} -p ${PORT}
echo " sleep..."
sleep 1

echo "############## Jitter and Datagram  #################"
iperf -c ${SERVERIP} -f m -u -w ${WINDOWSIZE} -p ${PORT}
echo " sleep..."
sleep 1




