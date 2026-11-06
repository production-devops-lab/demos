#!/usr/bin/env bash
# Challenge (lesson 9): turn forwarding off on r1, then ping r1's FAR address, 198.51.100.1, from h1.
# Does r1 answer? Why? Then ping h2 again, for comparison.
# Run it from the demo folder, as root: bash challenge-solution.sh
set -u
bash lab/net.sh reset routed
ip -n h1 route add default via 192.0.2.1
ip -n h2 route add default via 198.51.100.1
ip netns exec r1 sysctl -w net.ipv4.ip_forward=0
ip netns exec h1 ping -c 1 -W 1 198.51.100.1
echo "exit code: $?   (0 = r1 answered)"
ip netns exec h1 ping -c 1 -W 1 198.51.100.10
echo "exit code: $?   (1 = no reply: h2 is behind r1, and r1 does not forward)"
# Expected: 198.51.100.1 answers, with ttl=64: no router lowered it. The packet is FOR r1: the address
# belongs to r1, on its eth1, and Linux accepts a packet for any of its own addresses, whatever card it
# arrives on. That is local delivery, the first question of the diagram ("for one of my addresses?"):
# ip_forward is never asked. 198.51.100.10 belongs to h2, so r1 would have to forward it: no reply.
ip -n r1 route get 198.51.100.1
# "local 198.51.100.1 dev lo src 198.51.100.1 ... cache <local>": r1's own address, delivered locally.
