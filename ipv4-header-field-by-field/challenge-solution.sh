#!/usr/bin/env bash
# Challenge (lesson 8): send a ping with -Q 0xb8, capture it, and read the DS field: DSCP and ECN.
# Run it from the demo folder, as root: bash challenge-solution.sh
set -u
bash lab/net.sh reset pair
ip netns exec client tcpdump -n -i eth0 -w tos.pcap -Z root icmp 2>/dev/null &
sleep 1
# -Q 0xb8: the whole DS byte (the old ToS byte) of every packet ping sends
ip netns exec client ping -c 1 -Q 0xb8 192.0.2.2 >/dev/null
sleep 1
kill %1
wait
tcpdump -n -t -v -r tos.pcap -c 1
# Expected: "IP (tos 0xb8, ttl 64, ... proto ICMP (1), length 84)"
# 0xb8 = 1011 1000 in binary:
#   top 6 bits 101110 = 46 = DSCP EF (expedited forwarding, the class used for voice)
#   last 2 bits     00 = ECN: not ECN-capable transport
# In hex, the header starts 45b8: version 4, IHL 5, then the DS byte b8.
tcpdump -n -t -x -r tos.pcap -c 1 | head -2
