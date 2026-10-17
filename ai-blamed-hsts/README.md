# The AI Blamed HSTS. The Real Bug Was http:// on a TLS Port

Video: https://youtu.be/tEtOMVB1q9Y

An AI assistant diagnosed an empty page from a containerized web console: certificate name mismatch plus HSTS. Its fix seemed to work. We check every claim with one real command and find that the empty page came from plain http on a TLS port, that browsers never stored HSTS, and that the hosts-file change did nothing. Plus a short checklist for verifying AI troubleshooting.

## Files

- `serve.sh`
- `tls-server.py`

## Before you start

The video runs these commands first, off screen:

```bash
[ -f app.pem ] || openssl req -x509 -newkey rsa:2048 -nodes -keyout app.key -out app.pem -days 365 -subj /CN=app-server 2>/dev/null
./serve.sh app.pem app.key >/dev/null
```

## Commands from the video

Run them from inside this folder, in this order (some of them are expected to fail: that is the point of the demo).

```bash
curl -sS http://127.0.0.1:8443/
openssl s_client -connect 127.0.0.1:8443 -servername app-server -brief </dev/null
openssl x509 -in app.pem -noout -ext subjectAltName
curl -k -sS https://127.0.0.1:8443/
curl -k -sS -o /dev/null -w '%{http_code} -> %{redirect_url}\n' https://127.0.0.1:8443/app
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
