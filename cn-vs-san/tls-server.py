#!/usr/bin/env python3
"""Tiny HTTPS test server: a stand-in for a web console running in a container.

/          -> 404 + a small page whose script redirects to /app (common in Java app servers)
/app       -> 302 to /app/login
/app/login -> 200
Every response sends an HSTS header.   Usage: python3 tls-server.py CERT KEY [PORT]
"""
import ssl
import sys
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

HSTS = "max-age=31536000; includeSubDomains"


class Handler(BaseHTTPRequestHandler):
    protocol_version = "HTTP/1.1"

    def version_string(self):
        return "acme-app"

    def _send(self, code, body=b"", headers=()):
        self.send_response(code)
        self.send_header("Strict-Transport-Security", HSTS)
        for k, v in headers:
            self.send_header(k, v)
        self.send_header("Content-Type", "text/html; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        if self.command != "HEAD":
            self.wfile.write(body)

    def do_GET(self):
        if self.path == "/":
            self._send(404, b'<script>document.location.href="/app";</script>\n')
        elif self.path in ("/app", "/app/"):
            self._send(302, headers=[("Location", "/app/login")])
        elif self.path == "/app/login":
            self._send(200, b"<h1>acme-app: please log in</h1>\n")
        else:
            self._send(404, b"not found\n")

    do_HEAD = do_GET

    def log_message(self, *args):
        pass


cert, key = sys.argv[1], sys.argv[2]
port = int(sys.argv[3]) if len(sys.argv) > 3 else 8443
ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
ctx.load_cert_chain(cert, key)
srv = ThreadingHTTPServer(("127.0.0.1", port), Handler)
srv.socket = ctx.wrap_socket(srv.socket, server_side=True)
srv.serve_forever()
