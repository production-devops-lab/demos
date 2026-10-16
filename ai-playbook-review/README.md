# I Asked an AI for an Ansible Playbook. 6 Bugs a Senior Engineer Would Catch

Video: https://youtu.be/lwxMEYYR5uk

An AI assistant generated a complete Ansible playbook for a logging change: backups, validation, rollback, even emojis in the summary. It looked production ready. We run it for real and review it like a senior engineer would, bug by bug, with the fix for each one. Everything runs locally against localhost, in a throwaway directory.

## Files

- `ansible.cfg`
- `backups/run-1700000000/logrotate.d.backup/app`
- `backups/run-1700000000/logrotate.d.backup/web`
- `deploy-ai.yml`
- `deploy-fixed.yml`
- `files/app.logrotate`
- `handler-ai.yml`
- `inventory.ini`
- `rollback-ai.yml`
- `rollback-safe.yml`
- `target/etc/logrotate.d/app`
- `target/etc/logrotate.d/web`
- `validate-ai.yml`
- `validate-fixed.yml`

## Commands from the video

Run them from inside this folder, in this order (some of them are expected to fail: that is the point of the demo).

```bash
ansible-playbook deploy-ai.yml
ansible-playbook deploy-fixed.yml
ansible-playbook handler-ai.yml
ansible-playbook validate-ai.yml
ansible-playbook validate-fixed.yml
ls target/etc/logrotate.d
ansible-playbook rollback-ai.yml -e backup_dir=backups/run-170000000
ls target/etc/logrotate.d
cp -a backups/run-1700000000/logrotate.d.backup target/etc/logrotate.d
ansible-playbook rollback-safe.yml -e backup_dir=backups/run-170000000
ls target/etc/logrotate.d
ansible-playbook rollback-safe.yml -e backup_dir=backups/run-1700000000 && ls target/etc
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
