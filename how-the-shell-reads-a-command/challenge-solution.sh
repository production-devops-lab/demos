#!/usr/bin/env bash
# Challenge solution (lesson 3): your own command, available by name in every new terminal.
#
# 1) Create the command in ~/bin and make it executable:
#      mkdir -p ~/bin
#      printf '#!/usr/bin/env bash\necho "acme-app: running"\n' > ~/bin/acme-status
#      chmod +x ~/bin/acme-status
#
# 2) Make sure ~/bin is in PATH in every new terminal:
#    - RHEL / AlmaLinux 9: ~/.bashrc already adds ~/.local/bin and ~/bin to PATH.
#    - Ubuntu 24.04: ~/.profile adds ~/bin if the folder exists (log out and in again once).
#    - Anything else: add this line to ~/.bashrc:
#        PATH="$HOME/bin:$PATH"
#
# 3) Open a NEW terminal and check:
#      type acme-status      # acme-status is ~/bin/acme-status
#      acme-status           # acme-app: running
#
# 4) type -a test pwd:
#      test is a shell builtin      <- this one runs
#      test is /usr/bin/test        <- a separate program, for tools that cannot call bash builtins
#      pwd is a shell builtin
#      pwd is /usr/bin/pwd
#    The builtin is found first, so it wins. The programs exist for find -exec, xargs, env and other
#    tools that start a program directly, without a shell.
#
# This script does steps 1 and 3 for you, without touching your shell startup files.
set -euo pipefail

mkdir -p "$HOME/bin"
printf '#!/usr/bin/env bash\necho "acme-app: running"\n' > "$HOME/bin/acme-status"
chmod +x "$HOME/bin/acme-status"

case ":$PATH:" in
  *":$HOME/bin:"*) echo "~/bin is already in PATH" ;;
  *) echo "~/bin is NOT in PATH yet: add PATH=\"\$HOME/bin:\$PATH\" to ~/.bashrc" ;;
esac
PATH="$HOME/bin:$PATH" type acme-status
type -a test pwd
