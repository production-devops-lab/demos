# ProductionDevOps demos

Demo files and commands from the ProductionDevOps YouTube channel: real-world DevOps and SRE, explained with real commands.

Every folder matches one video. Everything runs in a throwaway directory or container: read the scripts before you run them.

| Video | Folder |
|---|---|
| [An AI Wrote My Bash Script. Review It Before You Run It](https://youtu.be/rzynBynomqw) | [`ai-bash-review/`](ai-bash-review/) |
| [The AI Blamed HSTS. The Real Bug Was http:// on a TLS Port](https://youtu.be/tEtOMVB1q9Y) | [`ai-blamed-hsts/`](ai-blamed-hsts/) |
| [I Asked an AI for an Ansible Playbook. 6 Bugs a Senior Engineer Would Catch](https://youtu.be/lwxMEYYR5uk) | [`ai-playbook-review/`](ai-playbook-review/) |
| Ansible Ad Hoc Commands: command, shell, raw and One-Line Changes | [`ansible-ad-hoc-commands/`](ansible-ad-hoc-commands/) |
| [Preview Every Ansible Change Before It Happens: --check and --diff](https://youtu.be/bOFDCkKRoWc) | [`ansible-check-diff/`](ansible-check-diff/) |
| Which ansible.cfg Is Ansible Really Using? Control Node Setup | [`ansible-control-node-config/`](ansible-control-node-config/) |
| Ansible Handlers: Restart Only When Something Changed (notify, flush, listen) | [`ansible-handlers/`](ansible-handlers/) |
| Ansible Inventories: Groups, Ranges and Patterns That Hit the Right Hosts | [`ansible-inventories/`](ansible-inventories/) |
| ansible-doc: Find Any Ansible Module and Read Its Docs Offline | [`ansible-modules-and-docs/`](ansible-modules-and-docs/) |
| [Your Ansible Tests Pass. One Group of Servers Is Still Broken.](https://youtu.be/S9vxvmT0Alw) | [`ansible-test-targets/`](ansible-test-targets/) |
| [The API Behind kubectl: See the Requests, Then Send Your Own](https://youtu.be/ZMJbws9InMs) | [`api-behind-kubectl/`](api-behind-kubectl/) |
| [401 or 403? The Three Gates of Every Kubernetes API Request](https://youtu.be/sEjGaLVMpu8) | [`authn-authz-admission/`](authn-authz-admission/) |
| [Your Bash Scripts Fail Silently. Fix It With One Line (set -euo pipefail)](https://youtu.be/7fyJngojTyQ) | [`bash-strict-mode/`](bash-strict-mode/) |
| [Bash trap: Clean Up Temp Files and Locks, Even When Your Script Fails](https://youtu.be/GlXI4k3eUhM) | [`bash-trap-cleanup/`](bash-trap-cleanup/) |
| [CN Is Dead, SAN Rules: Why Your Browser Rejects a "Valid" Certificate](https://youtu.be/4VyL2i0PN-w) | [`cn-vs-san/`](cn-vs-san/) |
| [What a Container Really Is: Namespaces and cgroups by Hand](https://youtu.be/i7dqLhTH69c) | [`containers-by-hand/`](containers-by-hand/) |
| [Containers and Kubernetes Explained for Sysadmins (No Hype)](https://youtu.be/Z7t-x6k1-VM) | [`containers-kubernetes-intro/`](containers-kubernetes-intro/) |
| cp, mv, rm and Links: The Traps, Hard Links vs Symlinks, and Inodes | [`copy-move-links/`](copy-move-links/) |
| [CrashLoopBackOff: The 5-Step Routine to Find the Real Cause](https://youtu.be/wk2GcCCF0kw) | [`crashloopbackoff-debug/`](crashloopbackoff-debug/) |
| [What Happens When You Create a Pod: The Full Journey](https://youtu.be/Oe54tngxiyk) | [`create-a-pod-deep-dive/`](create-a-pod-deep-dive/) |
| [The find -o Bug Almost Everyone Writes (and the One-Character Fix)](https://youtu.be/CeFtExfmAZM) | [`find-or-precedence/`](find-or-precedence/) |
| [How a Kubernetes Cluster Is Built: kubeadm, Certificates and kubeconfig](https://youtu.be/COD5qqO0emI) | [`how-a-cluster-is-built/`](how-a-cluster-is-built/) |
| How Ansible Really Works: SSH, Python and Idempotency, Step by Step | [`how-ansible-works/`](how-ansible-works/) |
| How the Shell Reads Your Command: Builtins, PATH, Aliases and History | [`how-the-shell-reads-a-command/`](how-the-shell-reads-a-command/) |
| [HSTS Explained: Why You Can't Click "Proceed Anyway"](https://youtu.be/3qI4BNjC8Y8) | [`hsts-explained/`](hsts-explained/) |
| [kubectl create vs apply: Stop Your Cluster Drifting From Git](https://youtu.be/FgkpneZH1Yc) | [`imperative-vs-declarative/`](imperative-vs-declarative/) |
| [journalctl Filters: Find the Error in Seconds, Not Minutes](https://youtu.be/CkM5DMevJ3g) | [`journalctl-filters/`](journalctl-filters/) |
| [journald vs logrotate: Who Rotates Which Logs on Linux?](https://youtu.be/8wSTzmsd_jA) | [`journald-vs-logrotate/`](journald-vs-logrotate/) |
| [Kubernetes Architecture Under the Hood: Who Really Talks to etcd](https://youtu.be/SUaWFr5oXSE) | [`k8s-architecture/`](k8s-architecture/) |
| [kubeconfig and Contexts: Never Run kubectl on the Wrong Cluster](https://youtu.be/nzbVyvq2rYY) | [`kubeconfig-contexts/`](kubeconfig-contexts/) |
| [Stop Scrolling kubectl Output: custom-columns, jsonpath and --sort-by](https://youtu.be/lHxPHbiN8dc) | [`kubectl-output-anatomy/`](kubectl-output-anatomy/) |
| [Liveness vs Readiness vs Startup Probes: Stop Killing Healthy Pods](https://youtu.be/IBvgdNBOyB8) | [`kubernetes-probes/`](kubernetes-probes/) |
| [A Log Health Check Script Your Monitoring Can Trust (Exit Codes 0, 1, 2)](https://youtu.be/dDuTM5zzXaY) | [`log-health-check/`](log-health-check/) |
| Ansible Plays, become and serial: One Playbook, Many Groups, Rolling Batches | [`multiple-plays-and-become/`](multiple-plays-and-become/) |
| [Is It the Network, TLS or the App? 3 Commands That Tell You](https://youtu.be/mdFgxKXBI8g) | [`network-tls-or-app/`](network-tls-or-app/) |
| Linux Permissions and Ownership: rwx, chmod, chown, umask, setuid, setgid and sticky | [`permissions-and-ownership/`](permissions-and-ownership/) |
| [Your Logs Vanish After Reboot? Make journald Persistent (the Right Way)](https://youtu.be/_TfFevUPuqE) | [`persistent-journald/`](persistent-journald/) |
| Pipes, Redirection and Expansion: What the Shell Does Before Your Command Runs | [`pipes-redirection-expansion/`](pipes-redirection-expansion/) |
| [What Really Happens When You Create a Pod](https://youtu.be/ppFUJIgkOdQ) | [`pod-lifecycle/`](pod-lifecycle/) |
| [Anatomy of a Production-Ready podman run (Every Flag Explained)](https://youtu.be/wJY6khjU9C8) | [`podman-run-anatomy/`](podman-run-anatomy/) |
| Kubernetes ResourceQuota and LimitRange: Why Your Pods Never Start | [`quotas-and-limitranges/`](quotas-and-limitranges/) |
| ReplicaSets and Deployments: The Control Loop That Replaces Your Pods | [`replicasets-control-loop/`](replicasets-control-loop/) |
| [Kubernetes Requests vs Limits: Why Pods Get OOMKilled (and Throttled)](https://youtu.be/nXlzXlAA7dw) | [`requests-limits-oomkilled/`](requests-limits-oomkilled/) |
| Kubernetes Requests, Limits and QoS: Throttling, OOM and Eviction | [`requests-limits-qos/`](requests-limits-qos/) |
| The RHCE Exam (EX294) Explained, Plus a Lab You Can Build Today | [`rhce-exam-and-lab/`](rhce-exam-and-lab/) |
| [Safe Kubernetes Rollouts: maxSurge, rollout status and rollout undo](https://youtu.be/I7LGVoCgWUo) | [`rollout-undo/`](rollout-undo/) |
| Shell Variables, the Environment and Getting Help: export, .bashrc and man | [`shell-variables-environment-help/`](shell-variables-environment-help/) |
| The Linux Filesystem Tree: /etc, /var, /proc, Paths and ls -l Explained | [`the-filesystem-tree/`](the-filesystem-tree/) |
| What Linux Really Is: Kernel, Distributions and Which One to Pick | [`what-linux-really-is/`](what-linux-really-is/) |
| Your First Ansible Playbook: YAML, Tasks and the PLAY RECAP, Line by Line | [`your-first-playbook/`](your-first-playbook/) |
| Your Linux Lab: VM, WSL, Container or Cloud, and Your First SSH Login | [`your-linux-lab/`](your-linux-lab/) |

Channel: https://www.youtube.com/@production-devops

Licensed under the MIT License.
