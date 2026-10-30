#!/usr/bin/env bash
# Two UDP messages from client to server: a small one, and the largest that fits in one frame
bash lab/net.sh reset pair
ip netns exec client tcpdump -n -i eth0 -w frames.pcap -Z root 2>/dev/null &
ip netns exec server nc -u -l 9000 >/dev/null &
sleep 1
echo hello | ip netns exec client nc -u -w 1 -p 40000 192.0.2.2 9000
head -c 1472 /dev/zero | ip netns exec client nc -u -w 1 -p 40000 192.0.2.2 9000
kill %1 %2
wait
echo "capture saved: frames.pcap"
