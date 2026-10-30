#!/usr/bin/env bash
# Challenge (lesson 4): send 1473 bytes instead of 1472. How many frames, and why?
# Run it from the demo folder, as root: bash challenge-solution.sh
set -u
bash lab/net.sh reset pair
ip netns exec client tcpdump -n -i eth0 -w big.pcap -Z root udp 2>/dev/null &
ip netns exec server nc -u -l 9000 >/dev/null &
sleep 1
head -c 1473 /dev/zero | ip netns exec client nc -u -w 1 -p 40000 192.0.2.2 9000
kill %1 %2; wait
tcpdump -n -t -e -v -r big.pcap 2>/dev/null
# Expected: TWO frames for one message. 1473 + 8 (UDP) + 20 (IP) = 1501 bytes > MTU 1500,
# so IP splits the packet into fragments (flags [+] = more fragments, offset 1480):
#   frame 1: 1514 bytes = 14 Ethernet + 20 IP + 1480 (8 UDP header + 1472 data)
#   frame 2:   35 bytes = 14 Ethernet + 20 IP + 1 byte of data
# Ethernet never carries more than the MTU: the layer above must split. Fragments: lesson 21.
