#!/usr/bin/env bash
# Challenge (lesson 7): before using an address, ask who has it. Duplicate address detection with
# arping -D, from h3: is 192.0.2.12 taken? Is 192.0.2.99 free?
# arping may need installing: apt-get install -y iputils-arping (Debian/Ubuntu), dnf install -y iputils (Fedora/RHEL)
# Run it from the demo folder, as root: bash challenge-solution.sh
set -u
bash lab/net.sh reset lan
# -D: duplicate address detection, the question is sent from 0.0.0.0 (nobody's cache changes)
# -c 1: one request   -w 2: wait at most 2 s   -I eth0: h3's card
ip netns exec h3 arping -D -c 1 -w 2 -I eth0 192.0.2.12
echo "exit code: $?   (1 = somebody answered: the address is TAKEN)"
ip netns exec h3 arping -D -c 1 -w 2 -I eth0 192.0.2.99
echo "exit code: $?   (0 = no answer: the address is FREE)"
# Expected: h2 answers for 192.0.2.12 ("Unicast reply from 192.0.2.12 [02:00:00:00:00:12]", exit 1);
# nobody answers for 192.0.2.99 ("Received 0 response(s)", exit 0).
# Bonus: arping -U -c 1 -I eth0 192.0.2.13 sends a gratuitous ARP: "who-has 192.0.2.13 tell 192.0.2.13".
