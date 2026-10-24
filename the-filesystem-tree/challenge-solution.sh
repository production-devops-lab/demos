#!/usr/bin/env bash
# Challenge solution (lesson 6): what kind of file is /etc/localtime, where does it point,
# and when did it last change? Only ls, file and stat.
#
#   ls -l /etc/localtime
#     lrwxrwxrwx. 1 root root 25 Oct  1 10:12 /etc/localtime -> ../usr/share/zoneinfo/UTC
#     ^ type l = a symbolic link; the target is after the arrow
#     (the size, 25 here, is the length of the target path, not of the time zone data)
#
#   file /etc/localtime
#     /etc/localtime: symbolic link to ../usr/share/zoneinfo/UTC
#   file -L /etc/localtime          (-L follows the link: what is really at the end)
#     /etc/localtime: timezone data, version 2, ...
#
#   stat /etc/localtime             the link itself: Modify = when the link was created or changed,
#                                   which is when the time zone was last set (timedatectl set-timezone)
#   stat -L /etc/localtime          the target file: its own dates (from the tzdata package)
#
# RHEL/AlmaLinux 9 uses a relative target (../usr/share/zoneinfo/...), Ubuntu 24.04 an absolute one
# (/usr/share/zoneinfo/Etc/UTC). Both are symlinks: change the time zone with timedatectl, never by hand.
set -euo pipefail

ls -l /etc/localtime
file /etc/localtime
file -L /etc/localtime
stat -c 'link:   %N, last changed %y' /etc/localtime
stat -L -c 'target: %n, %s bytes, last changed %y' /etc/localtime
