#!/usr/bin/env bash
# Challenge (lesson 26): make the SERVER close first. Who sends the first FIN, who ends in TIME-WAIT?
# Run it from the demo folder, as root: bash challenge-solution.sh
set -u
bash lab/net.sh reset pair && bash lab/net.sh tcp-options off
# The server reads the 6 bytes of hello, answers bye and closes at once: it does not wait for the client.
reply="head -c 6 > /dev/null; echo bye"
ip netns exec server socat -t 3 TCP-LISTEN:9000,bind=192.0.2.2 SYSTEM:"$reply" &
ip netns exec client tcpdump -n -i eth0 -w challenge.pcap -Z root port 9000 2>/dev/null &
sleep 1
# The client keeps its side open for 2 more seconds, then closes.
(echo hello; sleep 2) | ip netns exec client nc -N -p 40000 192.0.2.2 9000 >/dev/null
sleep 1; kill %2; wait
tcpdump -n -t -r challenge.pcap 2>/dev/null | tail -6
echo "--- client sockets"; ip netns exec client ss -tan
echo "--- server sockets"; ip netns exec server ss -tan
# Expected: the first FIN comes from 192.0.2.2.9000 (the server), and TIME-WAIT is on the SERVER:
# the side that closes first is the one that waits.
