#!/usr/bin/env bash
# One UDP message, hello, from client to server: we capture it to read its IPv4 header
bash lab/net.sh reset pair
ip netns exec client tcpdump -n -i eth0 -w ip.pcap -Z root udp 2>/dev/null &
ip netns exec server nc -u -l 9000 >/dev/null &
sleep 1
echo hello | ip netns exec client nc -u -w 1 -p 40000 192.0.2.2 9000
kill %1 %2
wait
echo "capture saved: ip.pcap"
