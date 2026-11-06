#!/usr/bin/env bash
# One ping from h1 to h2, captured on both cards of the router r1 (run it once the ping works)
ip netns exec r1 tcpdump -n -i eth0 -w in.pcap -Z root icmp 2>/dev/null &
ip netns exec r1 tcpdump -n -i eth1 -w out.pcap -Z root icmp 2>/dev/null &
sleep 1
ip netns exec h1 ping -c 1 198.51.100.10 >/dev/null
sleep 1
kill %1 %2
wait
echo "captures saved: in.pcap out.pcap"
