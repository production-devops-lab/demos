# Challenge solution: which addresses are valid?

**The question:** which of these are valid IPv4 addresses?
`198.51.100.25` · `203.0.113` · `192.0.2.256` · `203.0.113.0`

**The rule from the lesson:** an IPv4 address is **four** numbers, separated by **three** dots, and each
number goes from **0** to **255**.

| Address | Valid? | Why |
|---|---|---|
| `198.51.100.25` | **yes** | four numbers, all between 0 and 255 |
| `203.0.113` | no | only **three** numbers |
| `192.0.2.256` | no | **256** is above 255 |
| `203.0.113.0` | **yes** | four numbers, and 0 is allowed |

**Good to know:** an address ending in `.0` is written correctly, but networks often keep it for a
special job (it can name the whole network). You will meet that idea in Networking Fundamentals, in the
lesson on subnets. For this course, the rule above is all you need.

All the addresses in this course come from ranges reserved for examples (`192.0.2.x`, `198.51.100.x`,
`203.0.113.x`): no real computer uses them.
