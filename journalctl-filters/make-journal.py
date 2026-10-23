"""Build a lab journal in export format: two boots, acme-app crashes before a reboot."""
import random
from datetime import datetime, timedelta, timezone

random.seed(7)
OLD, NEW = "4c1f9a2e7b3d4e5f8a6b9c0d1e2f3a4b", "9e8d7c6b5a4f4e3d8c2b1a0f9e8d7c6b"
entries = []


def log(t, boot, unit, ident, pid, prio, msg, **extra):
    entries.append((t, boot, unit, ident, pid, prio, msg, extra))


def day(s):
    return datetime.strptime(s, "%Y-%m-%d %H:%M:%S").replace(tzinfo=timezone.utc)


def background(start, end, boot, app_pid, web_pid):
    t = start
    while t < end:
        log(t, boot, "acme-app.service", "acme-app", app_pid, 6, f"processed batch {random.randint(1000, 9999)} "
            f"({random.randint(5, 60)} orders)")
        for k in range(3):
            path = random.choice(["/api/orders", "/api/cart", "/health", "/api/products"])
            log(t + timedelta(seconds=20 * k + 7), boot, "acme-web.service", "acme-web", web_pid, 6,
                f"GET {path} 200 {random.randint(3, 40)}ms")
        if t.minute % 5 == 0 and t.second < 60:
            log(t + timedelta(seconds=1), boot, "cron.service", "CRON", 3000 + t.minute, 6,
                "(ops) CMD (/opt/app/bin/rotate-cache.sh)")
        if t.minute == 30:
            log(t + timedelta(seconds=30), boot, "acme-app.service", "acme-app", app_pid, 4,
                f"slow query: {random.randint(21, 29) / 10}s on orders table")
        t += timedelta(seconds=60)


# boot -1: evening until the crash and the reboot
s1 = day("2026-10-19 18:00:00")
log(s1, OLD, "init.scope", "systemd", 1, 6, "Started acme-app.service - Acme order service.", UNIT="acme-app.service")
background(s1 + timedelta(seconds=5), day("2026-10-20 02:12:00"), OLD, 2187, 2190)
log(day("2026-10-19 23:40:12"), OLD, "acme-app.service", "acme-app", 2187, 3, "payment gateway returned 502, order 7731 retried")
log(day("2026-10-20 01:05:44"), OLD, "acme-web.service", "acme-web", 2190, 4, "upstream acme-app slow: 1.8s")
log(day("2026-10-20 02:13:31"), OLD, "acme-web.service", "acme-web", 2190, 4, "upstream acme-app slow: 9.6s")
log(day("2026-10-20 02:14:06"), OLD, "acme-web.service", "acme-web", 2190, 3, "upstream acme-app unavailable: connection refused")
crash = [
    ("02:12:40", 4, "connection pool at 18/20"),
    ("02:13:15", 4, "connection pool at 20/20, requests queued"),
    ("02:13:52", 3, "request timeout after 30s: GET /api/orders"),
    ("02:13:58", 3, "request timeout after 30s: POST /api/checkout"),
    ("02:14:03", 2, "out of memory: cannot allocate worker buffer"),
]
for hhmmss, prio, msg in crash:
    log(day("2026-10-20 " + hhmmss), OLD, "acme-app.service", "acme-app", 2187, prio, msg)
log(day("2026-10-20 02:14:04"), OLD, "init.scope", "systemd", 1, 4,
    "acme-app.service: Main process exited, code=killed, status=9/KILL", UNIT="acme-app.service")
log(day("2026-10-20 02:14:04"), OLD, "init.scope", "systemd", 1, 4,
    "acme-app.service: Failed with result 'signal'.", UNIT="acme-app.service")
log(day("2026-10-20 02:18:30"), OLD, "systemd-logind.service", "systemd-logind", 640, 6, "New session 41 of user ops.")
log(day("2026-10-20 02:19:30"), OLD, "systemd-logind.service", "systemd-logind", 640, 6, "System is rebooting.")

# boot 0: after the reboot, healthy
s0 = day("2026-10-20 02:21:10")
log(s0, NEW, "init.scope", "systemd", 1, 6, "Started acme-app.service - Acme order service.", UNIT="acme-app.service")
background(s0 + timedelta(seconds=5), day("2026-10-20 09:30:00"), NEW, 914, 917)
log(day("2026-10-20 05:02:31"), NEW, "acme-app.service", "acme-app", 914, 3, "payment gateway returned 502, order 8120 retried")

entries.sort(key=lambda e: e[0])
mono = {OLD: 0, NEW: 0}
start = {OLD: s1, NEW: s0}
out = []
for t, boot, unit, ident, pid, prio, msg, extra in entries:
    us = int(t.timestamp() * 1_000_000)
    mono_us = int((t - start[boot]).total_seconds() * 1_000_000) + 4_000_000
    fields = [f"__REALTIME_TIMESTAMP={us}", f"__MONOTONIC_TIMESTAMP={mono_us}", f"_BOOT_ID={boot}",
              f"PRIORITY={prio}", f"_SYSTEMD_UNIT={unit}", f"SYSLOG_IDENTIFIER={ident}", f"_PID={pid}",
              "_HOSTNAME=node01", "_TRANSPORT=journal", f"MESSAGE={msg}"]
    fields += [f"{k}={v}" for k, v in extra.items()]
    out.append("\n".join(fields))
print("\n\n".join(out) + "\n")
