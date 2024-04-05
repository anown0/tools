export PATH=${PATH}:/sbin

# Set max OS send/receive buffers
sysctl -w net.core.rmem_max=8388608
sysctl -w net.core.wmem_max=8388608

# Set default send/receive sizes
sysctl -w net.core.rmem_default=65536
sysctl -w net.core.wmem_default=65536

# TCP Autotuning setting. "The tcp_mem variable defines how the TCP 
# stack should behave when it comes to memory usage. ... The first 
# value specified in the tcp_mem variable tells the kernel the low 
# threshold. Below this point, the TCP stack do not bother at all about 
# putting any pressure on the memory usage by different TCP sockets. ... 
# The second value tells the kernel at which point to start pressuring 
# memory usage down. ... The final value tells the kernel how many memory 
# pages it may use maximally. If this value is reached, TCP streams and 
# packets start getting dropped until we reach a lower memory usage again. 
# This value includes all TCP sockets currently in use." 
sysctl -w net.ipv4.tcp_mem='8388608 8388608 8388608'


# TCP Autotuning setting. "The first value tells the kernel the minimum 
# receive buffer for each TCP connection, and this buffer is always allocated 
# to a TCP socket, even under high pressure on the system. ... The second 
# value specified tells the kernel the default receive buffer allocated for 
# each TCP socket. This value overrides the /proc/sys/net/core/rmem_default 
# value used by other protocols. ... The third and last value specified in 
# this variable specifies the maximum receive buffer that can be allocated 
# for a TCP socket." 


sysctl -w net.ipv4.tcp_rmem='4096 87380 8388608'
sysctl -w net.ipv4.tcp_wmem='4096 65536 8388608'
sysctl -w net.ipv4.route.flush=1
