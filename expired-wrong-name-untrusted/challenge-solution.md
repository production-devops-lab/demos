# Challenge solution: the fourth card

**The challenge:** run the same command on `site4.crt`. Which check fails?

```console
sre@lab:~$ openssl x509 -in site4.crt -noout -subject -issuer -dates
subject=CN = shop.example
issuer=CN = Example Test CA
notBefore=Dec  1 00:00:00 2027 GMT
notAfter=Nov 30 00:00:00 2028 GMT
```

- **Name:** `shop.example`, the address we typed. OK.
- **Issuer:** `Example Test CA`, the trusted office of our lab. OK.
- **Dates:** **fail.** Our today was 18 November 2026, and the card is valid only *from* 1 December 2027.

**The surprise:** the card is not expired, it is **not valid yet**. The browser shows the same kind of date
warning. It happens when a card is installed too early, or when the computer's clock is behind (lesson 6).

**The fix:** use a card whose dates include today (or fix the clock, if that is the problem).

## The four cards of this lesson

| File | Name | Issuer | Dates | Verdict |
|---|---|---|---|---|
| `site1.crt` | shop.example | Example Test CA | until 30 Oct 2026 | **expired** |
| `site2.crt` | blog.example | Example Test CA | Nov 2026 – Oct 2027 | **wrong name** |
| `site3.crt` | shop.example | shop.example (itself) | Nov 2026 – Oct 2027 | **untrusted**: self-signed |
| `site4.crt` | shop.example | Example Test CA | from 1 Dec 2027 | **not valid yet** |

Make them at home with [`make-certs.sh`](make-certs.sh): `bash make-certs.sh ~/https-lab`, then
`cd ~/https-lab` and run the command on each file. Fictional test certificates, for learning only.
