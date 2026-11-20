# Challenge solution: the missing envelope

**The question:** pieces 1, 2, 4 and 5 arrive. What is missing? What happens next, for a web page?

**What is missing:** piece **3**. The receiver knows because every packet carries a number in its
header: after 2 comes 4, so 3 is missing.

**What happens next, for a web page:** the pieces that arrived are kept, and piece 3 is **sent again**.
When it arrives, the pieces are put back in order (1, 2, 3, 4, 5) and the page or the picture is
complete. You may only notice a tiny delay.

**And for a live video or voice call?** There is no time to wait for a copy: the missing piece is usually
skipped, and you see or hear a short glitch.

**Good to know:** the rules that number, sort and resend the pieces of a web page are called **TCP**.
Networking Fundamentals shows them on real captured packets.
