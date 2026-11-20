# Challenge solution: can a copied card fool the browser?

**The challenge:** someone copies `shop.example`'s certificate onto their own server. Can they pretend to be
the shop? Why?

**No.** The certificate is public: every visitor gets a copy, so copying it is easy. But during the
handshake the server must also *sign* this visit's messages, including the fresh random number your browser
just sent, with the **private key** that matches the public key on the card. Only the real shop has that
private key: it never leaves the shop's server.

The impostor can show the card, but cannot make the signature. Your browser's fourth check ("does the
signature match the sample on the card?") fails, and the browser stops with a warning.

In post office words: anyone can photocopy an ID card, but only its owner can make the signature that matches
the sample printed on it.

**What if the private key is stolen?** Then the owner must ask the office (the certificate authority) to
cancel the card, and get a new key and a new card.
