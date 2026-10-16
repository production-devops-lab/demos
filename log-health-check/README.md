# A Log Health Check Script Your Monitoring Can Trust (Exit Codes 0, 1, 2)

Video: https://youtu.be/dDuTM5zzXaY

Most ad-hoc check scripts print a nice message and then exit 0, so cron and monitoring never notice anything. Step by step, we turn a naive log check into a small, testable script with monitoring-style exit codes: 0 OK, 1 WARNING, 2 CRITICAL. Disk usage without parsing columns, stale logs, recent errors, every outcome tested, and a systemd timer to run it.

## Files

- `check-logs-naive.sh`
- `check-logs.sh`
- `systemd/check-logs.service`
- `systemd/check-logs.timer`
- `var-log/app.log`

## Commands from the video

Run them from inside this folder, in this order.

```bash
bash check-logs-naive.sh
echo "exit code: $?"
df -h var-log
df --output=pcent var-log
df --output=pcent var-log | tail -n 1 | tr -dc '0-9'; echo
export LOG_DIR=var-log
./check-logs.sh
echo "exit code: $?"
touch -d '2 hours ago' var-log/app.log
./check-logs.sh; echo "exit code: $?"
for i in 1 2 3 4 5 6; do echo 'ERROR db timeout' >> var-log/app.log; done
WARN=10 CRIT=20 ./check-logs.sh; echo "exit code: $?"
systemctl status check-logs.service --no-pager
journalctl -u check-logs.service -n 4 --no-pager
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
