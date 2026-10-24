#!/usr/bin/env bash
# Challenge solution (lesson 5): APP_ENV=lab in every LOGIN shell, alias ll in every INTERACTIVE shell,
# each in the right file. Bonus: find the man page of /etc/group.
#
# The right files:
#   - Variables (and PATH) belong to the login file:  ~/.bash_profile   (Ubuntu: ~/.profile, unless you
#     already have a ~/.bash_profile - bash reads only the FIRST of .bash_profile, .bash_login, .profile)
#       export APP_ENV=lab
#     Login shells pass their environment to every child, so all your programs and terminals inherit it.
#   - Aliases belong to ~/.bashrc (aliases are never inherited, every interactive shell must define them):
#       alias ll='ls -l'
#   - The login file must source ~/.bashrc, so login shells (ssh) get the aliases too:
#       if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
#     RHEL/AlmaLinux 9 and Ubuntu already ship this in /etc/skel, so it is in every new user's home.
#
# Proof (in a new terminal, or after `source ~/.bash_profile`):
#   bash -l -c 'echo "APP_ENV=$APP_ENV"'      -> APP_ENV=lab          (login shell: reads the profile)
#   bash -i -c 'type ll'                      -> ll is aliased to `ls -l'   (interactive: reads ~/.bashrc)
#   bash -c 'type ll'                         -> not found: scripts read no startup file
#
# Bonus: the format of /etc/group is in section 5:
#   man -k '^group'         -> group (5) - user group file
#   man 5 group
#
# This script proves it WITHOUT touching your real startup files: it uses a throwaway home folder.
set -euo pipefail

home=$(mktemp -d)
trap 'rm -rf "$home"' EXIT

cat > "$home/.bash_profile" <<'PROFILE'
export APP_ENV=lab
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
PROFILE
cat > "$home/.bashrc" <<'RC'
alias ll='ls -l'
RC

echo "login shell:       $(HOME=$home bash -l -c 'echo "APP_ENV=$APP_ENV"')"
echo "interactive shell: $(HOME=$home bash -i -c 'type ll' 2>/dev/null)"
echo "script:            $(HOME=$home bash -c 'type ll' 2>&1 || true)"
man -k '^group' 2>/dev/null || echo "no man index here: try 'man 5 group'"
