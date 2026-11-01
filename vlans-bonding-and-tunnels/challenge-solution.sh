#!/usr/bin/env bash
# Challenge (lesson 6): build the tunnel between h1 and h3 with GRE instead of IP-in-IP.
# What MTU does tun0 get, and what does tcpdump show on h1's cable?
# Run it from the demo folder, as root: bash challenge-solution.sh
set -u
bash lab/net.sh reset vlan                     # the VLAN lab: h1 and h3 meet in VLAN 10
# type gre instead of type ipip: same local/remote (the outer addresses), same inner subnet
ip -n h1 link add tun0 up type gre local 192.0.2.11 remote 192.0.2.13
ip -n h3 link add tun0 up type gre local 192.0.2.13 remote 192.0.2.11
ip -n h1 addr add 198.51.100.11/24 dev tun0
ip -n h3 addr add 198.51.100.13/24 dev tun0
echo "--- tun0 on h1:"; ip -n h1 link show tun0
ip netns exec h1 tcpdump -n -i eth0 -c 2 -w gre.pcap -Z root ip 2>/dev/null &
sleep 1
ip netns exec h1 ping -c 1 198.51.100.13 >/dev/null
wait
echo "--- what h1's cable carried:"; tcpdump -n -t -r gre.pcap 2>/dev/null
bash lab/net.sh down
# Expected: "mtu 1476": 1500 - 20 (outer IP header) - 4 (GRE header). GRE is IP protocol 47.
# tcpdump: "IP 192.0.2.11 > 192.0.2.13: GREv0, length 88: IP 198.51.100.11 > 198.51.100.13: ICMP echo request, ..."
# Three headers per packet: outer IP, GRE (4 bytes: flags and the inner protocol, 0x0800 = IPv4), inner IP.
# length 88 = GRE 4 + inner IP 20 + ICMP 8 + 56 bytes of ping data.
