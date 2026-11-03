# Challenge solution: a copy stops at 3 a.m.

**The question:** one copy of acme-app stops in the middle of the night. What happens by hand, and what
happens with Kubernetes?

**By hand:** nothing happens until a person notices. Someone gets an alert (or a complaint from a
visitor), wakes up, finds which server has room, and starts the copy again. Until then the app runs
with fewer copies, or not at all if it was the only one.

**With Kubernetes:** you said "three copies of acme-app". Kubernetes keeps comparing what you want
(three) with what it sees (two), so it starts a new copy on a server with room, usually within
seconds. Nobody has to wake up. A person still looks later at *why* the copy stopped: Kubernetes
replaces it, it does not fix the bug that made it stop.

The difference in one line: by hand, **you** are the one who checks and corrects; with Kubernetes, a
program does it all the time.
