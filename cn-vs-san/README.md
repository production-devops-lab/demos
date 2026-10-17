# CN Is Dead, SAN Rules: Why Your Browser Rejects a "Valid" Certificate

Video: https://youtu.be/4VyL2i0PN-w

curl accepts the certificate, the browser says NET::ERR_CERT_COMMON_NAME_INVALID. Both are right. Browsers check only the Subject Alternative Name list, while curl still falls back to the old Common Name. We read the names inside a certificate with openssl, test names safely with curl --resolve, create a development certificate with a proper SAN, and avoid the classic hosts-file workaround.

## Files

- `make-san-cert.sh`
- `serve.sh`
- `tls-server.py`

## Before you start

The video runs these commands first, off screen:

```bash
[ -f app.pem ] || openssl req -x509 -newkey rsa:2048 -nodes -keyout app.key -out app.pem -days 365 -subj /CN=app.lab.example 2>/dev/null
[ -f san.pem ] && ./serve.sh san.pem san.key >/dev/null || ./serve.sh app.pem app.key >/dev/null
```

## Commands from the video

Run them from inside this folder, in this order (some of them are expected to fail: that is the point of the demo).

```bash
openssl x509 -in app.pem -noout -subject
openssl x509 -in app.pem -noout -ext subjectAltName
curl --cacert app.pem --resolve app.lab.example:8443:127.0.0.1 https://app.lab.example:8443/app/login
curl -sS --cacert app.pem --resolve app.lab.example:8443:127.0.0.1 -o /dev/null -w '%{http_code}\n' https://app.lab.example:8443/app/login
./make-san-cert.sh
openssl x509 -in san.pem -noout -ext subjectAltName
./serve.sh san.pem san.key
curl -sS --cacert san.pem -o /dev/null -w '%{http_code}\n' https://localhost:8443/app/login
curl -sS --cacert san.pem -o /dev/null -w '%{http_code}\n' https://127.0.0.1:8443/app/login
curl -sS --cacert san.pem --resolve other.lab.example:8443:127.0.0.1 https://other.lab.example:8443/app/login
curl -sS --cacert san.pem -H 'Host: other.lab.example' -o /dev/null -w '%{http_code}\n' https://127.0.0.1:8443/app/login
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
