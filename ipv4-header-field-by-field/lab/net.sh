#!/usr/bin/env bash
# Networking Fundamentals - a lab on ONE Linux machine, built from network namespaces.
#   bash lab/net.sh up pair          two hosts, client 192.0.2.1 and server 192.0.2.2, one cable (veth)
#   bash lab/net.sh up lan           three hosts h1 h2 h3 (192.0.2.11-13) on one switch: bridge br0
#   bash lab/net.sh up vlan          the switch cut in two: h1 in VLAN 10, h2 in VLAN 20, h3 on a trunk
#   bash lab/net.sh up bond          h1 with two cables to the switch, joined into bond0; h2 on port3
#   bash lab/net.sh up tunnel        the vlan lab, plus an IP-in-IP tunnel tun0 between h1 and h3
#   bash lab/net.sh up routed        h1 (192.0.2.10) - router r1 - h2 (198.51.100.10): two subnets, no routes
#                                    beyond the connected ones, forwarding on r1 off (the Linux default)
#   bash lab/net.sh down             remove every lab host
#   bash lab/net.sh reset TOPOLOGY   down, then up: fresh hosts, no leftover connections
#   bash lab/net.sh tcp-options off  no TCP options except MSS (shorter tcpdump lines); 'on' = defaults
# Run it as root in a throwaway VM or container. Idempotent: run it again at any time.
# vlan, bond and tunnel are always built from scratch, with IPv6 off; they need a kernel with
# IPv6, 802.1Q VLANs, bonding and IP-in-IP (WSL2 has them). routed also has IPv6 off, where the kernel has it.
set -euo pipefail
ALL="client server h1 h2 h3 switch r1"

host() {    # host NAME: a new, empty network stack, with its loopback up
  [ -e "/run/netns/$1" ] || ip netns add "$1"
  ip -n "$1" link set lo up
}
cable() {   # cable A B PEER: a virtual cable (veth pair), eth0 in A, PEER in B
  ip -n "$1" link show eth0 >/dev/null 2>&1 ||
    ip link add eth0 netns "$1" type veth peer name "$3" netns "$2"
}
nic() {     # nic HOST ADDRESS MAC [CARD]: the card (eth0 by default) gets a fixed MAC and an address, and goes up
  ip -n "$1" link set "${4:-eth0}" address "$3" up
  ip -n "$1" addr replace "$2" dev "${4:-eth0}"
}
up_pair() { # two hosts, one cable
  host client; host server
  cable client server eth0
  nic client 192.0.2.1/24 02:00:00:00:00:01
  nic server 192.0.2.2/24 02:00:00:00:00:02
}

up_lan() {  # three hosts, each on a port of one switch: the bridge br0
  host switch
  ip -n switch link show br0 >/dev/null 2>&1 ||
    ip -n switch link add br0 type bridge mcast_snooping 0
  ip -n switch link set br0 up
  for n in 1 2 3; do
    host "h$n"
    cable "h$n" switch "port$n"
    ip -n switch link set "port$n" master br0 up
    nic "h$n" "192.0.2.1$n/24" "02:00:00:00:00:1$n"
  done
}

host4() {   # host4 NAME: a new host with IPv6 off: no IPv6 chatter in our captures
  host "$1"
  [ ! -d /proc/sys/net/ipv6 ] || ip netns exec "$1" sysctl -qw net/ipv6/conf/all/disable_ipv6=1
}
plug() {    # plug HOST NIC PORT: a cable from HOST's NIC to PORT, on the switch's br0
  ip link add "$2" netns "$1" type veth peer name "$3" netns switch
  ip -n switch link set "$3" master br0 up
}

up_vlan() { # one switch, two VLANs: h1 in VLAN 10, h2 in VLAN 20, h3 on a trunk
  host4 switch; host4 h1; host4 h2; host4 h3
  ip -n switch link add br0 type bridge mcast_snooping 0 vlan_filtering 1 vlan_default_pvid 0
  ip -n switch link set br0 up
  plug h1 eth0 port1; plug h2 eth0 port2; plug h3 eth0 port3
  bridge -n switch vlan add dev port1 vid 10 pvid untagged
  bridge -n switch vlan add dev port2 vid 20 pvid untagged
  bridge -n switch vlan add dev port3 vid 10
  bridge -n switch vlan add dev port3 vid 20
  nic h1 192.0.2.11/24 02:00:00:00:00:11
  nic h2 192.0.2.12/24 02:00:00:00:00:12
  ip -n h3 link set eth0 address 02:00:00:00:00:13 up
  ip -n h3 link add link eth0 name eth0.10 up type vlan id 10
  ip -n h3 addr add 192.0.2.13/24 dev eth0.10
}

up_bond() { # h1 with two cables to the switch, joined into bond0; h2 on port3
  host4 switch; host4 h1; host4 h2
  ip -n switch link add br0 type bridge mcast_snooping 0
  ip -n switch link set br0 up
  plug h1 eth0 port1; plug h1 eth1 port2; plug h2 eth0 port3
  ip -n h1 link add bond0 type bond mode active-backup miimon 100
  ip -n h1 link set eth0 master bond0
  ip -n h1 link set eth1 master bond0
  ip -n h1 link set bond0 address 02:00:00:00:00:11 up
  ip -n h1 addr add 192.0.2.11/24 dev bond0
  nic h2 192.0.2.12/24 02:00:00:00:00:12
}

up_tunnel() { # the VLAN lab, plus an IP-in-IP tunnel, tun0, from h1 to h3
  up_vlan
  ip -n h1 link add tun0 up type ipip local 192.0.2.11 remote 192.0.2.13
  ip -n h3 link add tun0 up type ipip local 192.0.2.13 remote 192.0.2.11
  ip -n h1 addr add 198.51.100.11/24 dev tun0
  ip -n h3 addr add 198.51.100.13/24 dev tun0
}

up_routed() { # two subnets joined by a router: h1 eth0 - eth0 [r1] eth1 - eth0 h2
  host4 h1; host4 r1; host4 h2
  cable h1 r1 eth0
  cable h2 r1 eth1
  nic h1 192.0.2.10/24 02:00:00:00:00:21
  nic h2 198.51.100.10/24 02:00:00:00:00:22
  nic r1 192.0.2.1/24 02:00:00:00:00:31
  nic r1 198.51.100.1/24 02:00:00:00:00:32 eth1
}

down() {    # delete every lab host; its cables go with it
  for h in $ALL; do
    if [ -e "/run/netns/$h" ]; then ip netns del "$h"; fi
  done
}

tcp_options() {
  local v=0 ts=0
  if [ "${1:-off}" = on ]; then v=1; ts=1; fi
  for h in client server; do
    ip netns exec "$h" sysctl -qw net/ipv4/tcp_timestamps=$ts net/ipv4/tcp_sack=$v net/ipv4/tcp_window_scaling=$v
  done
}

topology() {
  case "${1:-pair}" in
    pair) up_pair ;;
    lan)  up_lan ;;
    routed) up_routed ;;
    vlan|bond|tunnel) down; "up_$1" ;;   # always from scratch
    *)    echo "topologies: pair lan vlan bond tunnel routed"; exit 1 ;;
  esac
}

case "${1:-}" in
  up)          topology "${2:-pair}" ;;
  down)        down ;;
  reset)       down; topology "${2:-pair}" ;;
  tcp-options) tcp_options "${2:-off}" ;;
  *)           echo "usage: $0 up|reset pair|lan|vlan|bond|tunnel|routed | down | tcp-options on|off"; exit 1 ;;
esac
