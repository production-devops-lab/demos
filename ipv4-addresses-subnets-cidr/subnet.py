#!/usr/bin/env python3
# subnet.py ADDRESS/PREFIX: the network this address belongs to, computed exactly
import ipaddress
import sys

net = ipaddress.ip_interface(sys.argv[1]).network
print("network  ", net)
print("mask     ", net.netmask)
print("first    ", net[1])
print("last     ", net[-2])
print("broadcast", net.broadcast_address)
print("addresses", net.num_addresses)
