#!/usr/bin/env bash
# One UDP message from client to server, captured on the client's eth0
bash lab/net.sh reset pair
ip netns exec client tcpdump -n -i eth0 -w hello.pcap -Z root 2>/dev/null &
ip netns exec server nc -u -l 9000 &
sleep 1
echo hello | ip netns exec client nc -u -w 1 -p 40000 192.0.2.2 9000
kill %1 %2
wait
echo "capture saved: hello.pcap"
