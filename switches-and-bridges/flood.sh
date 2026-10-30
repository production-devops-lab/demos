#!/usr/bin/env bash
# Who sees a frame? Capture on h3 while h1 pings h2, before and after the switch learns
bash lab/net.sh reset lan
ip netns exec h3 tcpdump -n -i eth0 -w h3.pcap -Z root 2>/dev/null &
sleep 1
ip netns exec h1 ping -c 1 192.0.2.12 >/dev/null
bridge -n switch fdb flush dev br0 dynamic
ip netns exec h1 ping -c 1 192.0.2.12 >/dev/null
ip netns exec h1 ping -c 1 192.0.2.12 >/dev/null
sleep 1
kill %1
wait
echo "capture saved: h3.pcap"
