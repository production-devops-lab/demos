# Is It the Network, TLS or the App? 3 Commands That Tell You

Video: https://youtu.be/mdFgxKXBI8g

The container is up, the port is published, and the browser says the page did not send any data. Before restarting anything, check one layer at a time: TCP with nc, TLS with openssl s_client, HTTP with curl. We run all three for real against a small HTTPS test server and find two classic mistakes: plain http on a TLS port, and the wrong path.

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
nc -vz 127.0.0.1 8443
nc -vz 127.0.0.1 8444
openssl s_client -connect 127.0.0.1:8443 -servername app-server -brief </dev/null
curl -sS http://127.0.0.1:8443/
curl -k -i https://127.0.0.1:8443/
curl -k -i https://127.0.0.1:8443/app
curl -k -sS -o /dev/null -w '%{http_code}\n' https://127.0.0.1:8443/app/login
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
