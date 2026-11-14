#!/usr/bin/env bash
# Challenge solution: change the words after echo, and run it again. Is there a download?
# capture.py: run (this file also runs during the recording session, to check the answer)
#
# Answer: NO download. The image busybox:1.36 is already on this computer (the first run pulled it).
# Only the command after the image changed, and that is not part of the image: it is what the
# container does when it starts.

# The image is already here after the lesson: make sure of it (a pull prints nothing new if it is).
docker pull -q busybox:1.36 >/dev/null

echo "--- same image, different words:"
docker run --rm busybox:1.36 echo Hello again, from the same image
# You see only the new words: no "Unable to find image", no "Pulling".

# Bonus: a DIFFERENT image (another version, after the colon) is a different kit, so it IS downloaded.
# Try it yourself if you like (it downloads a few megabytes):
#   docker run --rm busybox:1.37 echo Hello from another version
