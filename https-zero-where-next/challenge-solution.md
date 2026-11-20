# Challenge solution: one HTTPS visit, in post office words

**The challenge:** tell one HTTPS visit in six steps, in post office words. A model answer:

1. **Find the address.** You ask the address book (DNS): where is `shop.example`? It answers with the
   address on the envelope, `203.0.113.10`.
2. **Say hello.** Your browser writes to that address: "hello, I want shop.example", with its half of a seal.
3. **The ID card.** The shop answers with the other half of the seal, its ID card (the certificate), and a
   signature over this visit's messages, made with the private key only the shop has.
4. **The checks.** Your browser checks the card: the **name** matches the address, **today** is between the
   two dates, and the **issuer** leads, office by office, up to an office on its list. The signature matches
   the sample on the card.
5. **The sealed letter.** Your request travels sealed: nobody on the way can read or change it.
6. **The sealed reply.** The page comes back sealed, and the padlock appears.

If a check fails at step 4, the browser stops before step 5 and shows a warning: wrong name, expired, or
untrusted.

**And the one thing to remember:** the padlock proves the name and the seal, not that the shop is honest.
Read the name.

**Where next:** TLS & HTTPS Troubleshooting for DevOps (with Networking Fundamentals first, if packets are new
to you).
