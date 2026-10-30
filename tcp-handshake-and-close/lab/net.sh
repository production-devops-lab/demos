#!/usr/bin/env bash
# Networking Fundamentals - a lab on ONE Linux machine, built from network namespaces.
#   bash lab/net.sh up pair          two hosts, client 192.0.2.1 and server 192.0.2.2, one cable (veth)
#   bash lab/net.sh down             remove every lab host
#   bash lab/net.sh reset pair       down, then up: fresh hosts, no leftover connections
#   bash lab/net.sh tcp-options off  no TCP options except MSS (shorter tcpdump lines); 'on' = defaults
# Run it as root in a throwaway VM or container. Idempotent: run it again at any time.
set -euo pipefail
HOSTS="client server"

up_pair() {
  for h in $HOSTS; do
    ip netns list 2>/dev/null | grep -qw "$h" || ip netns add "$h"
  done
  ip -n client link show eth0 >/dev/null 2>&1 ||
    ip link add eth0 netns client type veth peer name eth0 netns server
  ip -n client addr replace 192.0.2.1/24 dev eth0
  ip -n server addr replace 192.0.2.2/24 dev eth0
  for h in $HOSTS; do
    ip -n "$h" link set lo up
    ip -n "$h" link set eth0 up
  done
}

down() {
  for h in $HOSTS; do
    if ip netns list 2>/dev/null | grep -qw "$h"; then ip netns del "$h"; fi
  done
}

tcp_options() {
  local v=0 ts=0
  if [ "${1:-off}" = on ]; then v=1; ts=1; fi
  for h in $HOSTS; do
    ip netns exec "$h" sysctl -qw net/ipv4/tcp_timestamps=$ts net/ipv4/tcp_sack=$v net/ipv4/tcp_window_scaling=$v
  done
}

case "${1:-}" in
  up)          [ "${2:-pair}" = pair ] || { echo "topologies: pair"; exit 1; }; up_pair ;;
  down)        down ;;
  reset)       down; up_pair ;;
  tcp-options) tcp_options "${2:-off}" ;;
  *)           echo "usage: $0 up pair | down | reset pair | tcp-options on|off"; exit 1 ;;
esac
