# Your Logs Vanish After Reboot? Make journald Persistent (the Right Way)

Video: https://youtu.be/_TfFevUPuqE

With the default Storage=auto, whether your journal survives a reboot depends on a single directory that may or may not exist. We check what your server really does, make the journal persistent with a drop-in file, set sane size limits, manage it with Ansible, and verify the result across a reboot.

## Commands from the video

Run them from inside this folder, in this order.

```bash
journalctl --list-boots
ls -ld /var/log/journal
ls /run/log/journal
sudo mkdir -p /etc/systemd/journald.conf.d && sudo cp 10-persistent.conf /etc/systemd/journald.conf.d/ && sudo systemctl restart systemd-journald
journalctl -u systemd-journald -n 2 --no-pager
journalctl --list-boots
journalctl -b -1 -n 3 --no-pager
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
