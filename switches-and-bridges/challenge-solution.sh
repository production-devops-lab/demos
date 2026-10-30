#!/usr/bin/env bash
# Challenge (lesson 5): no flush this time. Make the switch forget by itself: set the ageing time
# to 5 seconds, stay silent for 15, ping again. Does h3 see the frame for h2?
# Run it from the demo folder, as root: bash challenge-solution.sh
set -u
bash lab/net.sh reset lan
ip -n switch link set br0 type bridge ageing_time 500      # 500 hundredths of a second = 5 s
ip netns exec h3 tcpdump -n -i eth0 -w age.pcap -Z root icmp 2>/dev/null &
sleep 1
ip netns exec h1 ping -c 1 192.0.2.12 >/dev/null           # the switch learns h1 and h2
echo "--- learned:"; bridge -n switch fdb show br br0 dynamic
sleep 15                                                   # silence: both entries age out (5 s + cleanup delay)
echo "--- after 15 s of silence:"; bridge -n switch fdb show br br0 dynamic
ip netns exec h1 ping -c 1 192.0.2.12 >/dev/null           # h2 is unknown again
sleep 1; kill %1; wait
echo "--- ICMP frames seen by h3:"; tcpdump -n -t -e -r age.pcap 2>/dev/null
# Expected: the table is empty after 15 s, and h3 sees ONE echo request addressed to
# 02:00:00:00:00:12: the second ping, flooded because the entry had aged out.
# The default ageing time is 300 s: a silent host is flooded to after 5 minutes.
