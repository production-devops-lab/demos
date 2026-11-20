#!/bin/bash
# Challenge solution, lesson 7 of AI Assistants for Ops: the Safe Basics.
#
# The error:          bash: ./deploy.sh: Permission denied
# The example answer: "Your user is not allowed on this server. Ask an admin for root access."
#
# The claim to check: "your user is not allowed". A command that only reads can check it: ls -l shows
# who may do what with the file. Here we rebuild the situation in a fresh temporary folder (nothing
# outside it is touched).
cd "$(mktemp -d)" || exit 1
printf '#!/bin/bash\necho "deploying acme-app (practice only)"\n' > deploy.sh
chmod 644 deploy.sh

echo "1) The error:"
./deploy.sh

echo "2) Check the claim with a command that only reads:"
ls -l deploy.sh
# -rw-r--r-- : no x anywhere. The file is not marked as runnable for anyone: it is about the FILE,
# not about your user. Root access is not the fix (and asking for it on a guess is a bad habit).

echo "3) The decision is yours. Two safe ways (Shell Scripting from Zero, lessons 1 and 3):"
bash deploy.sh            # run it through bash, no permission change needed
chmod u+x deploy.sh       # or mark it runnable for its owner
./deploy.sh
