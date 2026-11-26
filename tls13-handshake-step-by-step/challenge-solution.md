# Challenge solution: which cipher suite did the server pick?

```bash
LAB="-connect localhost:8443 -servername shop.example -CAfile ca.crt"
openssl s_client $LAB -trace </dev/null 2>/dev/null | grep cipher_suite
```

Two lines come back:

```
      cipher_suites (len=62)
      cipher_suite {0x13, 0x02} TLS_AES_256_GCM_SHA384
```

- `cipher_suites` (plural) is in the ClientHello: the list the client offers (its length, in bytes).
- `cipher_suite` (singular) is in the ServerHello: the one the server picked, `TLS_AES_256_GCM_SHA384`.

The same name appears in the `Ciphersuite:` line of `openssl s_client ... -brief` (lesson 1).
