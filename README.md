# ProductionDevOps demos

Demo files and commands from the ProductionDevOps YouTube channel: real-world DevOps and SRE, explained with real commands.

Every folder matches one video. Everything runs in a throwaway directory or container: read the scripts before you run them.

| Video | Folder |
|---|---|
| A Kubernetes Cluster, Drawn: Nodes, Control Plane and Desired State | [`a-cluster-drawn/`](a-cluster-drawn/) |
| [An AI Wrote My Bash Script. Review It Before You Run It](https://youtu.be/rzynBynomqw) | [`ai-bash-review/`](ai-bash-review/) |
| [The AI Blamed HSTS. The Real Bug Was http:// on a TLS Port](https://youtu.be/tEtOMVB1q9Y) | [`ai-blamed-hsts/`](ai-blamed-hsts/) |
| [I Asked an AI for an Ansible Playbook. 6 Bugs a Senior Engineer Would Catch](https://youtu.be/lwxMEYYR5uk) | [`ai-playbook-review/`](ai-playbook-review/) |
| [Ansible Ad Hoc Commands: command, shell, raw and One-Line Changes](https://youtu.be/rX_C5KA-WQM) | [`ansible-ad-hoc-commands/`](ansible-ad-hoc-commands/) |
| [Preview Every Ansible Change Before It Happens: --check and --diff](https://youtu.be/bOFDCkKRoWc) | [`ansible-check-diff/`](ansible-check-diff/) |
| [Which ansible.cfg Is Ansible Really Using? Control Node Setup](https://youtu.be/I7rtw3gkGJo) | [`ansible-control-node-config/`](ansible-control-node-config/) |
| Ansible Facts: setup, ansible_facts, Custom Facts, Fact Cache and Magic Variables | [`ansible-facts/`](ansible-facts/) |
| [Ansible Handlers: Restart Only When Something Changed (notify, flush, listen)](https://youtu.be/9cPjV6htswg) | [`ansible-handlers/`](ansible-handlers/) |
| [Ansible Inventories: Groups, Ranges and Patterns That Hit the Right Hosts](https://youtu.be/dbTDGsLU14E) | [`ansible-inventories/`](ansible-inventories/) |
| [ansible-doc: Find Any Ansible Module and Read Its Docs Offline](https://youtu.be/OrIu5SMOjUM) | [`ansible-modules-and-docs/`](ansible-modules-and-docs/) |
| [Ansible Modules: Ready-Made Tasks, file and copy (No Experience Needed)](https://youtu.be/UluSlQqApNg) | [`ansible-modules-ready-made/`](ansible-modules-ready-made/) |
| Ansible register and Jinja2 Filters: Catch a Task's Result, Then Shape It | [`ansible-register-and-filters/`](ansible-register-and-filters/) |
| [Your Ansible Tests Pass. One Group of Servers Is Still Broken.](https://youtu.be/S9vxvmT0Alw) | [`ansible-test-targets/`](ansible-test-targets/) |
| Ansible Variables and Precedence: Which Value Wins? (vars, group_vars, host_vars, -e) | [`ansible-variables-precedence/`](ansible-variables-precedence/) |
| Ansible Vault: Encrypt Secrets, Password Files, Vault IDs and encrypt_string | [`ansible-vault/`](ansible-vault/) |
| Ansible from Zero, Where Next: What You Can Do Now, and the RHCE Course | [`ansible-zero-where-next/`](ansible-zero-where-next/) |
| [The API Behind kubectl: See the Requests, Then Send Your Own](https://youtu.be/ZMJbws9InMs) | [`api-behind-kubectl/`](api-behind-kubectl/) |
| [ARP Explained: Who Has This IP? Request, Reply and the Neighbour Cache, in Real Captures](https://youtu.be/3RZGOvTo8wk) | [`arp/`](arp/) |
| [401 or 403? The Three Gates of Every Kubernetes API Request](https://youtu.be/sEjGaLVMpu8) | [`authn-authz-admission/`](authn-authz-admission/) |
| [Your Bash Scripts Fail Silently. Fix It With One Line (set -euo pipefail)](https://youtu.be/7fyJngojTyQ) | [`bash-strict-mode/`](bash-strict-mode/) |
| [Bash trap: Clean Up Temp Files and Locks, Even When Your Script Fails](https://youtu.be/GlXI4k3eUhM) | [`bash-trap-cleanup/`](bash-trap-cleanup/) |
| [CN Is Dead, SAN Rules: Why Your Browser Rejects a "Valid" Certificate](https://youtu.be/4VyL2i0PN-w) | [`cn-vs-san/`](cn-vs-san/) |
| [What a Container Really Is: Namespaces and cgroups by Hand](https://youtu.be/i7dqLhTH69c) | [`containers-by-hand/`](containers-by-hand/) |
| [Containers and Kubernetes Explained for Sysadmins (No Hype)](https://youtu.be/Z7t-x6k1-VM) | [`containers-kubernetes-intro/`](containers-kubernetes-intro/) |
| [cp, mv, rm and Links: The Traps, Hard Links vs Symlinks, and Inodes](https://youtu.be/Q0_x5dxMVyU) | [`copy-move-links/`](copy-move-links/) |
| [CrashLoopBackOff: The 5-Step Routine to Find the Real Cause](https://youtu.be/wk2GcCCF0kw) | [`crashloopbackoff-debug/`](crashloopbackoff-debug/) |
| [What Happens When You Create a Pod: The Full Journey](https://youtu.be/Oe54tngxiyk) | [`create-a-pod-deep-dive/`](create-a-pod-deep-dive/) |
| [Ethernet Frames and MAC Addresses, Field by Field (EtherType, MTU, tcpdump -e)](https://youtu.be/QkC51XTzi4U) | [`ethernet-frames-and-mac/`](ethernet-frames-and-mac/) |
| [The find -o Bug Almost Everyone Writes (and the One-Character Fix)](https://youtu.be/CeFtExfmAZM) | [`find-or-precedence/`](find-or-precedence/) |
| Forwarding and Routing Tables: Default Route, Longest Prefix Match and ip_forward, on a Real Router | [`forwarding-and-routing-tables/`](forwarding-and-routing-tables/) |
| [How a Kubernetes Cluster Is Built: kubeadm, Certificates and kubeconfig](https://youtu.be/COD5qqO0emI) | [`how-a-cluster-is-built/`](how-a-cluster-is-built/) |
| [How Ansible Really Works: SSH, Python and Idempotency, Step by Step](https://youtu.be/U0oEk5AXrZA) | [`how-ansible-works/`](how-ansible-works/) |
| [How Ansible Works, Drawn: Control Node, SSH and Modules (No Experience Needed)](https://youtu.be/0dZMvQpGprg) | [`how-ansible-works-drawn/`](how-ansible-works-drawn/) |
| [How the Internet Is Layered: Encapsulation on a Real Packet (Linux Lab, tcpdump)](https://youtu.be/RuLUmcPWsA0) | [`how-the-internet-is-layered/`](how-the-internet-is-layered/) |
| [How the Shell Reads Your Command: Builtins, PATH, Aliases and History](https://youtu.be/h1M-xueelQE) | [`how-the-shell-reads-a-command/`](how-the-shell-reads-a-command/) |
| [HSTS Explained: Why You Can't Click "Proceed Anyway"](https://youtu.be/3qI4BNjC8Y8) | [`hsts-explained/`](hsts-explained/) |
| [kubectl create vs apply: Stop Your Cluster Drifting From Git](https://youtu.be/FgkpneZH1Yc) | [`imperative-vs-declarative/`](imperative-vs-declarative/) |
| [IPv4 Addresses, Subnets and CIDR Without Fear (Masks, Prefixes, VLSM, Aggregation)](https://youtu.be/OQYk657Ft9Q) | [`ipv4-addresses-subnets-cidr/`](ipv4-addresses-subnets-cidr/) |
| The IPv4 Header, Field by Field: Version, TTL, Flags, Checksum and Options in a Real Capture | [`ipv4-header-field-by-field/`](ipv4-header-field-by-field/) |
| Jobs, Signals and Priorities: fg, bg, kill, nohup, nice and renice | [`jobs-signals-priorities/`](jobs-signals-priorities/) |
| [journalctl Filters: Find the Error in Seconds, Not Minutes](https://youtu.be/CkM5DMevJ3g) | [`journalctl-filters/`](journalctl-filters/) |
| [journald vs logrotate: Who Rotates Which Logs on Linux?](https://youtu.be/8wSTzmsd_jA) | [`journald-vs-logrotate/`](journald-vs-logrotate/) |
| [Kubernetes Architecture Under the Hood: Who Really Talks to etcd](https://youtu.be/SUaWFr5oXSE) | [`k8s-architecture/`](k8s-architecture/) |
| [kubeconfig and Contexts: Never Run kubectl on the Wrong Cluster](https://youtu.be/nzbVyvq2rYY) | [`kubeconfig-contexts/`](kubeconfig-contexts/) |
| [Stop Scrolling kubectl Output: custom-columns, jsonpath and --sort-by](https://youtu.be/lHxPHbiN8dc) | [`kubectl-output-anatomy/`](kubectl-output-anatomy/) |
| [Liveness vs Readiness vs Startup Probes: Stop Killing Healthy Pods](https://youtu.be/IBvgdNBOyB8) | [`kubernetes-probes/`](kubernetes-probes/) |
| [A Log Health Check Script Your Monitoring Can Trust (Exit Codes 0, 1, 2)](https://youtu.be/dDuTM5zzXaY) | [`log-health-check/`](log-health-check/) |
| [Ansible Plays, become and serial: One Playbook, Many Groups, Rolling Batches](https://youtu.be/NYSKGVOSk7Y) | [`multiple-plays-and-become/`](multiple-plays-and-become/) |
| [Is It the Network, TLS or the App? 3 Commands That Tell You](https://youtu.be/mdFgxKXBI8g) | [`network-tls-or-app/`](network-tls-or-app/) |
| [Linux Permissions and Ownership: rwx, chmod, chown, umask, setuid, setgid and sticky](https://youtu.be/HKb_dzHXP_I) | [`permissions-and-ownership/`](permissions-and-ownership/) |
| [Your Logs Vanish After Reboot? Make journald Persistent (the Right Way)](https://youtu.be/_TfFevUPuqE) | [`persistent-journald/`](persistent-journald/) |
| [Pipes, Redirection and Expansion: What the Shell Does Before Your Command Runs](https://youtu.be/qaRT-9rcPek) | [`pipes-redirection-expansion/`](pipes-redirection-expansion/) |
| [What Really Happens When You Create a Pod](https://youtu.be/ppFUJIgkOdQ) | [`pod-lifecycle/`](pod-lifecycle/) |
| [Anatomy of a Production-Ready podman run (Every Flag Explained)](https://youtu.be/wJY6khjU9C8) | [`podman-run-anatomy/`](podman-run-anatomy/) |
| Linux Processes: ps, top, PID and PPID, /proc and Process States | [`processes-ps-top-proc/`](processes-ps-top-proc/) |
| [Kubernetes ResourceQuota and LimitRange: Why Your Pods Never Start](https://youtu.be/M9SgQ6mohgc) | [`quotas-and-limitranges/`](quotas-and-limitranges/) |
| [ReplicaSets and Deployments: The Control Loop That Replaces Your Pods](https://youtu.be/VDJOnuixJwc) | [`replicasets-control-loop/`](replicasets-control-loop/) |
| [Kubernetes Requests vs Limits: Why Pods Get OOMKilled (and Throttled)](https://youtu.be/nXlzXlAA7dw) | [`requests-limits-oomkilled/`](requests-limits-oomkilled/) |
| [Kubernetes Requests, Limits and QoS: Throttling, OOM and Eviction](https://youtu.be/2_-RIsJVjlE) | [`requests-limits-qos/`](requests-limits-qos/) |
| [The RHCE Exam (EX294) Explained, Plus a Lab You Can Build Today](https://youtu.be/Fih0METh0Lo) | [`rhce-exam-and-lab/`](rhce-exam-and-lab/) |
| [Safe Kubernetes Rollouts: maxSurge, rollout status and rollout undo](https://youtu.be/I7LGVoCgWUo) | [`rollout-undo/`](rollout-undo/) |
| Run It Twice, Nothing Breaks: Idempotency in Ansible (No Experience Needed) | [`run-it-twice-nothing-breaks/`](run-it-twice-nothing-breaks/) |
| Searching and Transforming Text: grep, cut, sort, uniq, sed and awk | [`searching-and-transforming-text/`](searching-and-transforming-text/) |
| [Shell Variables, the Environment and Getting Help: export, .bashrc and man](https://youtu.be/ogYkJs7TGgg) | [`shell-variables-environment-help/`](shell-variables-environment-help/) |
| [Special IP Addresses and IPv6 Notation (Private, Loopback, Link-Local, Multicast, Anycast)](https://youtu.be/7XofcM7P3dY) | [`special-addresses-and-ipv6/`](special-addresses-and-ipv6/) |
| [How a Switch Learns: Linux Bridge, MAC Table and Flooding, Proven in a Capture](https://youtu.be/4u0tc2HaUNY) | [`switches-and-bridges/`](switches-and-bridges/) |
| TCP Three-Way Handshake and Close, Packet by Packet (SYN, ISN, FIN, Half-Close) | [`tcp-handshake-and-close/`](tcp-handshake-and-close/) |
| Editing Files in Linux: vim Essentials, nano and Config Files | [`text-files-and-editors/`](text-files-and-editors/) |
| [The Linux Filesystem Tree: /etc, /var, /proc, Paths and ls -l Explained](https://youtu.be/or3EGe7yHjk) | [`the-filesystem-tree/`](the-filesystem-tree/) |
| [VLANs, Bonding and Tunnels on Linux: the 802.1Q Tag, Failover and the MTU Tax](https://youtu.be/GwgKeZRzkCw) | [`vlans-bonding-and-tunnels/`](vlans-bonding-and-tunnels/) |
| [What Linux Really Is: Kernel, Distributions and Which One to Pick](https://youtu.be/Z2CeWyJcuKk) | [`what-linux-really-is/`](what-linux-really-is/) |
| [Why Automate? Ten Servers by Hand (Ansible from Zero, No Experience Needed)](https://youtu.be/ghkJtTYfEFs) | [`why-automate-ten-servers/`](why-automate-ten-servers/) |
| [Why Kubernetes Exists: From One Server to Many (No Experience Needed)](https://youtu.be/oLztxycFOdg) | [`why-kubernetes-exists/`](why-kubernetes-exists/) |
| Writing Shell Scripts: Arguments, if, case, Loops, Functions and Exit Codes | [`writing-shell-scripts/`](writing-shell-scripts/) |
| [YAML for Ansible in Five Minutes: Keys, Lists and Spaces (No Experience Needed)](https://youtu.be/SvjDtckCUU8) | [`yaml-for-ansible/`](yaml-for-ansible/) |
| [Your Ansible Inventory: the List of Servers, ansible-inventory --graph (No Experience Needed)](https://youtu.be/9Ow1sKpmQYc) | [`your-ansible-inventory/`](your-ansible-inventory/) |
| [Your First Ansible Ad Hoc Command: ansible all -m ping (No Experience Needed)](https://youtu.be/O-DsDxHKrOA) | [`your-first-ad-hoc-command/`](your-first-ad-hoc-command/) |
| Your First Ansible Playbook, Line by Line: ansible-playbook (No Experience Needed) | [`your-first-ansible-playbook/`](your-first-ansible-playbook/) |
| [Your First Ansible Playbook: YAML, Tasks and the PLAY RECAP, Line by Line](https://youtu.be/W446YdksMYE) | [`your-first-playbook/`](your-first-playbook/) |
| [Your Linux Lab: VM, WSL, Container or Cloud, and Your First SSH Login](https://youtu.be/DvtYpV5tHTQ) | [`your-linux-lab/`](your-linux-lab/) |

Channel: https://www.youtube.com/@production-devops

Licensed under the MIT License.
