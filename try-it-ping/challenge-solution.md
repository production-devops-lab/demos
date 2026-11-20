# Challenge solution: ping localhost

**The challenge:** run `ping -c 4 localhost`. Which address answers? How many replies?

**On Linux or WSL** you see something like this (your times will differ):

```text
PING localhost (127.0.0.1) 56(84) bytes of data.
64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.019 ms
64 bytes from localhost (127.0.0.1): icmp_seq=2 ttl=64 time=0.040 ms
64 bytes from localhost (127.0.0.1): icmp_seq=3 ttl=64 time=0.032 ms
64 bytes from localhost (127.0.0.1): icmp_seq=4 ttl=64 time=0.022 ms

--- localhost ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3078ms
rtt min/avg/max/mdev = 0.019/0.028/0.040/0.008 ms
```

**The answers:**

1. **Which address answers?** `127.0.0.1`, this same computer. `localhost` is a name, so your computer
   first looks it up in its own tiny address book (lesson 3), then pings the address it found.
2. **How many replies?** **4**: four lines start with `64 bytes from`, and the summary says
   `4 received, 0% packet loss`. `-c 4` asked for four, and all four came back.

**You may see `::1` instead.** On some computers `localhost` points first to `::1`. That is the same
"this computer", written as an IPv6 address, the longer kind of address from lesson 2. The answer is the
same: this computer, four replies.

**On Windows** (PowerShell or Command Prompt) the count is `-n`, not `-c`: `ping -n 4 localhost`. Without
it, Windows sends four anyway. On Linux and macOS, `ping` without `-c` never stops: press **Ctrl+C**.

## Good to know: the lab in the video

The second machine in the video (`192.0.2.2`) is not a real computer on the internet. It is the course lab,
[`lab/net.sh`](lab/net.sh) with the `pair` topology: two machines, `192.0.2.1` and `192.0.2.2`, joined by a
virtual cable, built inside one Linux computer with network namespaces. The terminal in the video speaks as
the first machine: every `ping` runs inside it. To do the same on your own Linux machine or WSL (it needs
root, so use a throwaway VM if you can):

```bash
sudo bash lab/net.sh up pair                       # build the two machines
sudo ip netns exec client ping -c 3 192.0.2.2      # ping the second one, from the first
sudo ip netns exec client ping -c 2 -W 1 192.0.2.3 # nobody has .3: 100% packet loss
sudo bash lab/net.sh down                          # remove the lab
```

`ip netns exec client` means "run this command inside the first machine". Networking Fundamentals builds
this lab step by step.
