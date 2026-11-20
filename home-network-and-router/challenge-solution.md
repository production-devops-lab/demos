# Challenge solution: what does the shop see?

**The question:** the TV at `10.88.0.12` asks the shop (`203.0.113.10`) for a video. Which From address
does the shop see?

**The answer:** `198.51.100.7`, the **public** address of the home router.

**Why:**

1. The TV sends its request with From `10.88.0.12`, its **private** address.
2. The router swaps that From for its own public address, `198.51.100.7`, and keeps a note: this
   conversation belongs to the TV. This swap is **NAT**, network address translation.
3. The shop answers to `198.51.100.7`, the only address it saw.
4. The router reads its note and passes the answer to the TV.

The private address `10.88.0.12` **never leaves** the home: like a flat number, it means nothing outside
the building.

**Good to know:** private addresses start with `10.`, `172.16` to `172.31`, or `192.168`. Many home
routers use `192.168` addresses; this course uses `10.88.0.x`, which is private too.
