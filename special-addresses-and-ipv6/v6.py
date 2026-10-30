#!/usr/bin/env python3
# v6.py ADDRESS...: each IPv6 address in its full form and its short form
import ipaddress
import sys

for arg in sys.argv[1:]:
    ip = ipaddress.IPv6Address(arg)
    print("full: ", ip.exploded)
    print("short:", ip.compressed)
