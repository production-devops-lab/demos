# Challenge solution: the five steps of one visit

**The question:** put these five steps in the right order: draw the page · get the address · send the
request · ask the address book · get the answer.

**The answer:**

1. **Ask the address book.** The browser knows only a name, `shop.example`. It asks DNS, the internet's
   address book: where is this name?
2. **Get the address.** The answer is an IP address, four numbers such as `203.0.113.10`.
3. **Send the request.** The browser sends a request to that address: please send the home page.
4. **Get the answer.** The shop's server answers with the page.
5. **Draw the page.** The browser reads the answer and draws the page on your screen. If the page needs
   pictures or colours, each one makes the same trip again.

**Why this order?** Envelopes need an address, not a name: that is why the address book always comes
first. Lessons 2 to 7 zoom into each step: IP addresses, DNS, ports, packets, routers, clients and
servers.

`shop.example` and `203.0.113.10` are reserved for examples: no real shop uses them.
