# Lab: Using Wireshark to Observe the TCP 3-Way Handshake

A documentation and evidence repository for the Cisco Networking Academy CyberOps lab **"Using Wireshark to Observe the TCP 3-Way Handshake"** (lab 9.2.6).

In this lab you capture the traffic between a web browser on host **H1** and a web server on host **H4** inside a Mininet topology, then analyze the TCP three-way handshake (SYN, SYN-ACK, ACK) with Wireshark and `tcpdump`.

> **Status:** Template / not yet completed.
> This repository contains the structure, scripts, commands, and checklists for the lab. No screenshots, captures, or answers are included. You add your own evidence as you perform each step, and tick off the progress tracker below.

> **Attribution:** The lab itself is © Cisco and/or its affiliates. This repository does not redistribute the lab PDF. It contains original notes, helper scripts, and templates written to support completing the lab.

---

## Table of Contents

- [Objectives](#objectives)
- [Topology](#topology)
- [Requirements](#requirements)
- [Repository Structure](#repository-structure)
- [How to Use This Repository](#how-to-use-this-repository)
- [Progress Tracker](#progress-tracker)
- [Quick Command Reference](#quick-command-reference)
- [Documentation Index](#documentation-index)
- [License](#license)

---

## Objectives

| Part | Goal |
|------|------|
| **Part 1** | Prepare the hosts to capture the traffic (Mininet, web server on H4, Firefox and `tcpdump` on H1) |
| **Part 2** | Analyze the captured packets using Wireshark (IPs, TCP ports, TCP flags, sequence/ack numbers) |
| **Part 3** | View the captured packets using `tcpdump` |
| **Cleanup** | Quit Mininet and clean up its processes |
| **Reflection** | Answer two reflection questions about Wireshark filters and uses |

## Topology

```
                     172.16.0.0/12
              .1 +----+ ----------- .40 +----+
        +--------| R1 |                 | H4 |  (web server)
        |        +----+                 +----+
        | .1
   10.0.0.0/24
        |
     +----+
     | S1 |
     +----+
    /   |   \
 .11   .12   .13
+----+ +----+ +----+
| H1 | | H2 | | H3 |
+----+ +----+ +----+
```

- **H1** (`10.0.0.11`): client, runs Firefox, `tcpdump`, and Wireshark
- **H4** (`172.16.0.40`): runs the web server
- **R1**: router between `10.0.0.0/24` and `172.16.0.0/12`
- **S1**: switch connecting H1, H2, H3 to R1

See [docs/topology.md](docs/topology.md) for details.

## Requirements

- **CyberOps Workstation** virtual machine (provided by Cisco Networking Academy)
- Pre-installed in that VM: Mininet, Wireshark, `tcpdump`, Firefox
- Lab support files located at `/home/analyst/lab.support.files/scripts/`

## Repository Structure

```
wireshark-tcp-3way-handshake-lab/
├── README.md                  # This file
├── COMMANDS.md                # Every command in the lab, explained
├── EVIDENCE_CHECKLIST.md      # What to capture for each task
├── LICENSE
├── .gitignore
├── docs/                      # Lab overview, topology, notes, troubleshooting
├── scripts/                   # Helper shell scripts for the lab steps
├── commands/                  # Plain-text copy/paste command lists per part
├── screenshots/               # Your screenshots, organized by part
├── evidence/                  # Capture file, tcpdump output, answers
├── backup/                    # Timestamped backups of capture.pcap
```

Each important folder has its own `README.md` explaining its purpose.

## How to Use This Repository

1. **Read the lab overview:** [docs/lab-overview.md](docs/lab-overview.md).
2. **Follow the commands** in [COMMANDS.md](COMMANDS.md), or use the helper scripts in [scripts/](scripts/README.md) inside the CyberOps VM.
3. **Capture evidence** as you go, using [EVIDENCE_CHECKLIST.md](EVIDENCE_CHECKLIST.md) and the naming rules in [screenshots/README.md](screenshots/README.md).
4. **Write your answers** in [evidence/answers/lab-answers.md](evidence/answers/lab-answers.md).
5. **Back up your capture** with `scripts/backup_capture.sh`.
6. **Update the progress tracker** below, then commit and push.

## Progress Tracker

Tick these only when you have actually completed and evidenced the task.

**Part 1: Prepare the Hosts to Capture the Traffic**
- [ ] Logged in to the CyberOps VM
- [ ] Started Mininet
- [ ] Opened xterm windows for H1 and H4
- [ ] Started the web server on H4
- [ ] Switched to the `analyst` user on H1 and started Firefox
- [ ] Started the `tcpdump` capture (50 packets) on H1
- [ ] Browsed to `172.16.0.40` in Firefox

**Part 2: Analyze the Packets using Wireshark**
- [ ] Opened `capture.pcap` in Wireshark and applied the `tcp` filter
- [ ] Analyzed frame 1 (SYN) and answered the questions
- [ ] Analyzed frame 2 (SYN, ACK) and answered the questions
- [ ] Analyzed frame 3 (ACK) and answered the question

**Part 3: View the Packets using tcpdump**
- [ ] Looked up the `-r` switch in the `tcpdump` man page
- [ ] Viewed the first 3 TCP packets with `tcpdump -r`

**Cleanup and Reflection**
- [ ] Quit Mininet
- [ ] Ran `sudo mn -c`
- [ ] Answered the reflection questions
- [ ] Backed up `capture.pcap`

## Quick Command Reference

| Where | Command |
|-------|---------|
| VM terminal | `sudo lab.support.files/scripts/cyberops_topo.py` |
| Mininet CLI | `xterm H1` / `xterm H4` |
| H4 | `/home/analyst/lab.support.files/scripts/reg_server_start.sh` |
| H1 | `su analyst` then `firefox &` |
| H1 | `sudo tcpdump -i H1-eth0 -v -c 50 -w /home/analyst/capture.pcap` |
| H1 | `wireshark &` |
| Terminal | `tcpdump -r /home/analyst/capture.pcap tcp -c 3` |
| Mininet CLI | `quit` |
| VM terminal | `sudo mn -c` |

Full explanations are in [COMMANDS.md](COMMANDS.md).

## Documentation Index

| File | Purpose |
|------|---------|
| [docs/lab-overview.md](docs/lab-overview.md) | Summary of the lab, parts, and resources |
| [docs/topology.md](docs/topology.md) | Hosts, IP addresses, and roles |
| [docs/tcp-handshake-notes.md](docs/tcp-handshake-notes.md) | Background notes on the 3-way handshake and port classes |
| [docs/troubleshooting.md](docs/troubleshooting.md) | Common problems and fixes |
| [COMMANDS.md](COMMANDS.md) | Command explanations |
| [EVIDENCE_CHECKLIST.md](EVIDENCE_CHECKLIST.md) | Evidence to collect |

## License

Released under the [MIT License](LICENSE). The original lab content remains the property of Cisco.
