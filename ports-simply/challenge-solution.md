# Challenge solution: which program answers?

**The question:** which program answers at `203.0.113.10:22`? And at `shop.example:8080`?

**The rule from the lesson:** the part before the colon finds the **computer** (an address, or a name
that DNS turns into an address). The number after the colon is the **port**: it finds the **program**.

| Written | Computer | Port | Program that answers |
|---|---|---|---|
| `203.0.113.10:22` | the server at `203.0.113.10` | **22** | remote login, **SSH** (a well-known port) |
| `shop.example:8080` | the computer that DNS finds for `shop.example` | **8080** | whatever program **listens** on 8080, often a **test** web server |

**Why "whatever program listens"?** 22, 80, 443 and 53 are well known: everyone agrees on them. 8080 is
only a common habit for test web servers, so the honest answer is: the program that was started on port
8080. If no program listens there, you get **connection refused**: the computer is there, the department
is closed.
