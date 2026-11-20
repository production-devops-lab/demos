# Challenge solution: read the office's own card

**The challenge:** read `test-ca.crt`, the office's own card. Who is it for? Who signed it?

```console
sre@lab:~$ openssl x509 -in test-ca.crt -noout -subject -issuer
subject=CN = Example Test CA
issuer=CN = Example Root CA
```

- **Who is it for?** `Example Test CA`: the office itself. Offices have ID cards too.
- **Who signed it?** `Example Root CA`, the head office. This is the chain from lesson 4: the root vouches
  for the test office, and the test office signs `shop.crt`.

Bonus: `openssl x509 -in root-ca.crt -noout -subject -issuer` shows the same name twice. The root signs its
own card; your browser trusts it only because it is on its list (the trust store).

## Make the same test certificates at home

The video uses fictional test certificates made by [`make-certs.sh`](make-certs.sh) (in the episode's
files): a test office, `Example Root CA` and `Example Test CA`, and a card for `shop.example`, all with fixed
dates. For learning only: never use them for a real site.

```bash
bash make-certs.sh ~/https-lab     # creates ~/https-lab with the .crt files
cd ~/https-lab
openssl x509 -in shop.crt -noout -subject -issuer -dates
```

`openssl` is already installed on most Linux systems and on macOS; on Windows use WSL. The private keys stay
in the hidden folder `.ca`: never share or show a private key.

**Good to know:** browsers check a second list of names inside the card, the *Subject Alternative Name*:
`openssl x509 -in shop.crt -noout -ext subjectAltName` shows `shop.example` and `www.shop.example`. The TLS
& HTTPS Troubleshooting course explains why it matters.
