# Challenge solution: ask port 8444 to verify shop.example

```bash
openssl s_client -connect localhost:8444 -servername shoppe.example -CAfile ca.crt -verify_hostname shop.example -brief </dev/null
```

The output still says `CONNECTION ESTABLISHED` and `Protocol version: TLSv1.3`, but now:

```
Verification error: hostname mismatch
```

Why: the server on port 8444 shows a certificate for `shoppe.example`. It is signed by an office we trust
(`ca.crt`), so the signatures are fine, but the name inside it is not `shop.example`. `-verify_hostname`
compares the two names, and they differ.

Note: `openssl s_client` prints the error and carries on (exit code 0): it is a diagnostic tool. A browser
or `curl` would stop here and refuse to send any data.
