# Challenge solution: the chain, in order

**The challenge:** put in order, top to bottom: `shop.example` · `Example Root CA` · `Example Test CA`. Which
one is on the list?

```text
Example Root CA      the head office (root CA): it signs its own card
   │ vouches for
Example Test CA      a branch office (an intermediate CA)
   │ vouches for
shop.example         the site's ID card
```

**On the list (the trust store):** only **Example Root CA**, the root. Your browser does not need the branch
office or the site on its list: it walks up the chain, signature by signature, until it reaches a root that
*is* on the list.

**Who sends what:** the site sends its own card and the branch office's card; the root's card is already on
your computer.

All three names are fictional: `Example Root CA` and `Example Test CA` are the test offices made by
`make-certs.sh` in lesson 5's demo folder. You can check the chain there:

```bash
openssl x509 -in shop.crt    -noout -subject -issuer   # shop.example, signed by Example Test CA
openssl x509 -in test-ca.crt -noout -subject -issuer   # Example Test CA, signed by Example Root CA
openssl x509 -in root-ca.crt -noout -subject -issuer   # Example Root CA, signed by itself
```
