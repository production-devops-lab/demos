# Challenge solution: what does the padlock promise?

**The challenge:** promised or not?

- **A · nobody on the way reads my order** → **promised.** With HTTPS your letter is sealed (encrypted): the
  café Wi-Fi and the routers on the way pass it on, but cannot read it, and cannot change it unnoticed.
- **B · this shop is honest** → **not promised.** The padlock never says anything about honesty. A fake shop
  can get a certificate for its own name and show a padlock too: a sealed letter to a con artist is still
  sealed, but it still arrives at the con artist.
- **C · I reached the site in the address** → **promised.** The site showed its ID card (certificate) and your
  browser checked it: the name on the card matches the address, and the server proved it owns the card.

**The habit to keep:** the padlock tells you *how* you talk (sealed) and *to whom* (the name in the address).
So always read the name: `shop.example` and `shopp.example` both get a padlock.

**Good to know:** some browsers now show a different icon instead of a padlock, or no icon at all on HTTPS
pages, and only warn on pages that are *not* secure. The meaning is the same.
