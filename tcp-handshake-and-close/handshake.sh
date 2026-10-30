#!/usr/bin/env bash
# One TCP conversation between client and server, captured on the client's eth0
bash lab/net.sh reset pair
bash lab/net.sh tcp-options off
reply="cat > /dev/null; sleep 1; echo bye"
ip netns exec server socat -t 3 TCP-LISTEN:9000,bind=192.0.2.2 SYSTEM:"$reply" &
ip netns exec client tcpdump -n -i eth0 -w hs.pcap -Z root port 9000 2>/dev/null &
sleep 1
( echo hello; sleep 1 ) | ip netns exec client nc -N -p 40000 192.0.2.2 9000 >/dev/null
sleep 1
kill %2
wait
echo "capture saved: hs.pcap"
