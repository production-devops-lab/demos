# Challenge solution: reading a domain name

**The question:** in `mail.acme.example`, which part is the biggest area? Which part is one computer?

**The rule from the lesson:** read a name from the **right**. The rightmost part is the biggest area,
and each part to its left is something inside it.

| Part | What it is | In the postal comparison |
|---|---|---|
| `example` | the **biggest area** (the top of the name) | the country |
| `acme` | one name inside it, owned by one organisation | the town |
| `mail` | **one computer** of `acme.example`, here its mail server | one house |

So: `example` is the biggest area, and `mail` is the one computer.

**Good to know:** `.example` is a name reserved for examples, like `example.com`: it never points to a
real computer, so it is safe to use in lessons.
