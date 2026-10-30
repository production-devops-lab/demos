#!/usr/bin/env bash
# Challenge (lesson 3): the link-local IPv6 address (modified EUI-64) for the server's MAC 02:00:00:00:00:02
# Run it from the demo folder: bash challenge-solution.sh
set -eu
mac=02:00:00:00:00:02
python3 - "$mac" <<'PY'
import ipaddress, sys
b = bytes.fromhex(sys.argv[1].replace(":", ""))        # 6 bytes
eui = b[:3] + b"\xff\xfe" + b[3:]                       # 1. insert ff:fe in the middle -> 8 bytes
eui = bytes([eui[0] ^ 0x02]) + eui[1:]                  # 2. flip the bit worth 2 in byte 1
ip = ipaddress.IPv6Address(b"\xfe\x80" + bytes(6) + eui)  # 3. after the fe80::/64 prefix
print("interface ID:", eui.hex(":"))
print("full: ", ip.exploded)
print("short:", ip.compressed)
PY
# Expected: interface ID 00:00:00:ff:fe:00:00:02, short form fe80::ff:fe00:2
