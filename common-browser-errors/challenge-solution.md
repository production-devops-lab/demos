# Challenge solution: a laptop living in 2019

**The challenge:** your laptop's clock says the year 2019. What warning do many sites show? Why?

**A date warning**, on many sites at once: the clue word in the error code is about the **date** (or the
clock).

**Why:** your browser's dates check compares *its own* "today" with the two dates on the card. Today's
certificates were issued years after 2019, so for your laptop their "valid from" date is still in the
future: the card is **not valid yet**. The browser cannot tell "the card is wrong" from "my clock is wrong",
so it warns.

**The clue that it is your clock, not the sites:** the warning appears on almost *every* HTTPS site at the
same time. A real expired card is usually one site.

**The fix:** set your computer's date and time correctly (turn on automatic time). The warnings disappear.
No need to click "continue anyway", ever.
