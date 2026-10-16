# journald vs logrotate: Who Rotates Which Logs on Linux?

Video: https://youtu.be/8wSTzmsd_jA

Modern Linux boxes have two log systems: the systemd journal and the classic text files in /var/log. They rotate in completely different ways, and mixing them up leads to full disks, empty log files and broken journals. We look at what each one owns, dry-run real logrotate rules, and fix the two mistakes we see most often.

## Commands from the video

Run them from inside this folder, in this order.

```bash
journalctl --disk-usage
systemd-analyze cat-config systemd/journald.conf | grep -E '^#?(SystemMaxUse|SystemKeepFree|MaxFileSec)='
ls /etc/logrotate.d
cat /etc/logrotate.d/acme
logrotate -d -f /etc/logrotate.d/acme 2>&1 | grep -E 'considering|copying|truncating'
logrotate -d -f /etc/logrotate.d/journal 2>&1 | grep -E 'renaming|compressing'
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
