#!/usr/bin/env bash
# Challenge (lesson 2): renumber the lab to 192.0.2.50/26 and 192.0.2.70/26. Does ping work?
# Run it from the demo folder, as root: bash challenge-solution.sh
set -u
bash lab/net.sh reset pair
# Remove the /24 addresses, then give each host its /26 address.
ip -n client addr flush dev eth0
ip -n server addr flush dev eth0
ip -n client addr add 192.0.2.50/26 dev eth0
ip -n server addr add 192.0.2.70/26 dev eth0
echo "--- client routes:"; ip -n client route
echo "--- ping from 192.0.2.50 to 192.0.2.70:"
ip netns exec client ping -c 1 -W 1 192.0.2.70 || echo "=> no route: 192.0.2.70 is outside 192.0.2.0/26"
# Fix: one common prefix that covers both, /25 (192.0.2.0 - 192.0.2.127).
ip -n client addr replace 192.0.2.50/25 dev eth0 && ip -n client addr del 192.0.2.50/26 dev eth0
ip -n server addr replace 192.0.2.70/25 dev eth0 && ip -n server addr del 192.0.2.70/26 dev eth0
echo "--- with /25 on both:"
ip netns exec client ping -c 1 -W 1 192.0.2.70 >/dev/null && echo "=> ping works: same network 192.0.2.0/25"
bash lab/net.sh reset pair   # back to the normal lab
