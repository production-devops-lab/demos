#!/usr/bin/env bash
# Challenge solution (lesson 8): releases/v1, releases/v2 and a symlink "current" -> v2,
# then switch "current" to v1 with ONE ln command.
#
#   mkdir -p releases/v1 releases/v2
#   ln -s releases/v2 current            current -> releases/v2   (relative to the link's folder)
#   ln -sfn releases/v1 current          current -> releases/v1
#
# Why -n? "current" is a symlink to a FOLDER. Without -n, ln follows it like a folder and creates
# the new link INSIDE the target:  releases/v2/v1 -> releases/v1  (and "current" is unchanged).
# -n (--no-dereference) treats "current" as a plain name, and -f replaces it.
#
# Real deployments use exactly this layout (/opt/app/releases/<version> + /opt/app/current):
# a rollback is one ln -sfn. For a fully atomic switch: ln -s releases/v1 current.tmp && mv -T current.tmp current
#
# This script shows both cases inside a throwaway folder.
set -euo pipefail

work=$(mktemp -d)
trap 'rm -rf -- "$work"' EXIT
cd "$work"

mkdir -p releases/v1 releases/v2
ln -s releases/v2 current
echo "start:        current -> $(readlink current)"

ln -sf releases/v1 current               # the trap: no -n
echo "ln -sf:       current -> $(readlink current); inside v2: $(ls releases/v2)"

ln -sfn releases/v1 current              # the fix
echo "ln -sfn:      current -> $(readlink current)"
