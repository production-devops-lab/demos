#!/usr/bin/env bash
# Networking Fundamentals - a lab on ONE Linux machine, built from network namespaces.
#   bash lab/net.sh up pair          two hosts, client 192.0.2.1 and server 192.0.2.2, one cable (veth)
#   bash lab/net.sh up lan           three hosts h1 h2 h3 (192.0.2.11-13) on one switch: bridge br0
#   bash lab/net.sh down             remove every lab host
#   bash lab/net.sh reset pair|lan   down, then up: fresh hosts, no leftover connections
#   bash lab/net.sh tcp-options off  no TCP options except MSS (shorter tcpdump lines); 'on' = defaults
# Run it as root in a throwaway VM or container. Idempotent: run it again at any time.
set -euo pipefail
ALL="client server h1 h2 h3 switch"

host() {    # host NAME: a new, empty network stack, with its loopback up
  [ -e "/run/netns/$1" ] || ip netns add "$1"
  ip -n "$1" link set lo up
}
cable() {   # cable A B PEER: a virtual cable (veth pair), eth0 in A, PEER in B
  ip -n "$1" link show eth0 >/dev/null 2>&1 ||
    ip link add eth0 netns "$1" type veth peer name "$3" netns "$2"
}
nic() {     # nic HOST ADDRESS MAC: eth0 gets a fixed MAC and an address, and goes up
  ip -n "$1" link set eth0 address "$3" up
  ip -n "$1" addr replace "$2" dev eth0
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
    *)    echo "topologies: pair lan"; exit 1 ;;
  esac
}

case "${1:-}" in
  up)          topology "${2:-pair}" ;;
  down)        down ;;
  reset)       down; topology "${2:-pair}" ;;
  tcp-options) tcp_options "${2:-off}" ;;
  *)           echo "usage: $0 up pair|lan | down | reset pair|lan | tcp-options on|off"; exit 1 ;;
esac
