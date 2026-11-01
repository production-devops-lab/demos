#!/usr/bin/env bash
# Who sees ARP? Capture on h1 and on h3 while h1 pings h2 for the first time
bash lab/net.sh reset lan
ip netns exec h1 tcpdump -n -i eth0 -w h1.pcap -Z root arp 2>/dev/null &
ip netns exec h3 tcpdump -n -i eth0 -w h3.pcap -Z root arp 2>/dev/null &
sleep 1
ip netns exec h1 ping -c 1 192.0.2.12 >/dev/null
sleep 1
kill %1 %2
wait
echo "captures saved: h1.pcap h3.pcap"
