# nmap 172.20.100.* -p 0 --exclude 172.20.100.80 | egrep "Interesting ports on|MAC Address" | sed ':a;N;$!ba;s/:\n/ /g' | awk '{print $4 " "$7}'

nmap -sS -P0 -A -v $1

