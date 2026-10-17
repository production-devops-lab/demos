# HSTS Explained: Why You Can't Click "Proceed Anyway"

Video: https://youtu.be/3qI4BNjC8Y8

A certificate error with no way to continue, or a browser that keeps forcing https: that is HSTS. We read the Strict-Transport-Security header, watch curl remember it and upgrade http to https by itself, see when browsers ignore the header (and when they don't), and how to fix or clear it in a development browser without disabling security.

## Files

- `serve.sh`
- `tls-server.py`

## Before you start

The video runs these commands first, off screen:

```bash
[ -f san.pem ] || openssl req -x509 -newkey rsa:2048 -nodes -keyout san.key -out san.pem -days 365 -subj /CN=app.lab.example -addext subjectAltName=DNS:app.lab.example,DNS:localhost,IP:127.0.0.1 2>/dev/null
./serve.sh san.pem san.key >/dev/null
```

## Commands from the video

Run them from inside this folder, in this order (some of them are expected to fail: that is the point of the demo).

```bash
curl -sSI --cacert san.pem https://localhost:8443/app/login | grep -i strict-transport
curl -sS --hsts hsts.txt --cacert san.pem --resolve app.lab.example:8443:127.0.0.1 -o /dev/null -w '%{http_code}\n' https://app.lab.example:8443/app/login
tail -1 hsts.txt
curl -sS --hsts hsts.txt --cacert san.pem --resolve app.lab.example:8443:127.0.0.1 -o /dev/null -w '%{url_effective}\n' http://app.lab.example:8443/app/login
curl -sS --hsts hsts.txt --cacert san.pem --resolve dev.app.lab.example:8443:127.0.0.1 -o /dev/null -w '%{url_effective}\n' http://dev.app.lab.example:8443/app/login
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
