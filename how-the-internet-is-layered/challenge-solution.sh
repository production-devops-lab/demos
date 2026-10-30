#!/usr/bin/env bash
# Challenge (lesson 1): send hello over TCP instead of UDP. How many packets now, and why?
# Run it from the demo folder, as root: bash challenge-solution.sh
set -u
bash lab/net.sh reset pair
ip netns exec client tcpdump -n -i eth0 -w tcp.pcap -Z root port 9000 2>/dev/null &
# TCP server: nc without -u. -N on the client sends FIN when its input ends.
ip netns exec server nc -l 9000 &
sleep 1
echo hello | ip netns exec client nc -N -p 40000 192.0.2.2 9000
sleep 1; kill %1 %2 2>/dev/null; wait
tcpdump -n -t -r tcp.pcap 2>/dev/null
echo "--- packets: $(tcpdump -n -r tcp.pcap 2>/dev/null | wc -l)"
# Expected: about 8 packets for the same 6 bytes, against 1 with UDP:
#   3 to open the connection (SYN, SYN-ACK, ACK), 1 with the data and 1 ACK for it,
#   then FIN/ACK packets to close (3 or 4). TCP sets up state at both ends first, then
#   confirms every byte: that is the "connection" that exists only in the end hosts.
#   Lesson 26 reads this conversation packet by packet.
