# COMMANDS.md

Every command used in the lab, in order, with an explanation. Prompts show where each command runs.

| Prompt | Meaning |
|--------|---------|
| `[analyst@secOps ~]$` | CyberOps VM terminal (user `analyst`) |
| `mininet>` | Mininet CLI |
| `[root@secOps analyst]#` | xterm window of a Mininet host (runs as root) |

Matching helper scripts live in [scripts/](scripts/README.md). Plain copy/paste lists live in [commands/](commands/README.md).

---

## Part 1: Prepare the Hosts to Capture the Traffic

### 1. Start Mininet

```bash
[analyst@secOps ~]$ sudo lab.support.files/scripts/cyberops_topo.py
```

Runs the lab's Python script that builds the virtual topology (H1 to H4, R1, S1) and opens the `mininet>` CLI. `sudo` is required because Mininet creates network namespaces and virtual interfaces.
Helper: `scripts/01_start_mininet.sh`

### 2. Open terminals for H1 and H4

```
mininet> xterm H1
mininet> xterm H4
```

Opens one terminal window per host. Commands typed in an xterm run *on that host*.

### 3. Start the web server on H4

```bash
[root@secOps analyst]# /home/analyst/lab.support.files/scripts/reg_server_start.sh
```

Runs the lab script that starts a web server on H4 (`172.16.0.40`). Run it in the **H4** xterm.
Helper: `scripts/02_start_web_server_H4.sh`

### 4. Switch from root to the analyst user (on H1)

```bash
[root@secOps analyst]# su analyst
```

Firefox cannot run as root, so switch user (`su`) to `analyst`. Run in the **H1** xterm.

### 5. Start Firefox (on H1)

```bash
[analyst@secOps ~]$ firefox &
```

Starts the browser. The `&` runs it in the background so the terminal stays usable. It can take a few moments to open.
Helper: `scripts/03_start_firefox_H1.sh`

### 6. Start the packet capture (on H1)

```bash
[analyst@secOps ~]$ sudo tcpdump -i H1-eth0 -v -c 50 -w /home/analyst/capture.pcap
```

| Option | Meaning |
|--------|---------|
| `-i H1-eth0` | Capture on H1's network interface |
| `-v` | Verbose; lets you watch progress |
| `-c 50` | Stop after capturing 50 packets |
| `-w /home/analyst/capture.pcap` | Write raw packets to this file |

Helper: `scripts/04_capture_traffic_H1.sh`

### 7. Generate traffic

In Firefox on H1, quickly browse to:

```
172.16.0.40
```

This triggers the TCP handshake and HTTP request that `tcpdump` records. Do this right after `tcpdump` starts.

---

## Part 2: Analyze the Packets using Wireshark

### 8. Start Wireshark (on H1)

```bash
[analyst@secOps ~]$ wireshark &
```

Click **OK** on the warning about running Wireshark as superuser.
Helper: `scripts/05_open_wireshark_H1.sh`

### 9. Open the capture and filter (GUI steps)

1. **File > Open**, then select `/home/analyst/capture.pcap`
2. In the filter bar, type `tcp` and apply it. The first 3 frames are the handshake.
3. Select a packet, then expand **Transmission Control Protocol** and **Flags** in the packet details pane.

| Frame | Expected role | Flags to look for |
|-------|---------------|-------------------|
| 1 | Client starts the session | SYN |
| 2 | Server replies | SYN, ACK |
| 3 | Client completes the handshake | ACK |

---

## Part 3: View the Packets using tcpdump

### 10. Read the manual page

```bash
[analyst@secOps ~]$ man tcpdump
```

Inside the man page: `/-r` searches forward, `n` goes to the next match, `?` searches backward, `q` quits. Use this to find what the `-r` switch does.

### 11. Read the first 3 TCP packets from the capture

```bash
[analyst@secOps ~]$ tcpdump -r /home/analyst/capture.pcap tcp -c 3
```

| Part | Meaning |
|------|---------|
| `-r <file>` | Read packets from a saved file instead of the network |
| `tcp` | Capture filter expression: only TCP packets |
| `-c 3` | Show only 3 packets (increase to see more) |

Helper: `scripts/06_view_capture_tcpdump.sh`

In `tcpdump` output, the flags appear as: `[S]` = SYN, `[S.]` = SYN-ACK, `[.]` = ACK.

---

## Cleanup

### 12. Quit Mininet

```
mininet> quit
```

Stops the hosts, switch, and links. Run in the terminal where Mininet was started.

### 13. Clean up leftover Mininet processes

```bash
[analyst@secOps ~]$ sudo mn -c
```

Removes processes and interfaces left behind by Mininet. Enter the VM password when prompted.
Helper: `scripts/07_cleanup_mininet.sh`

---

## Optional Helpers (not part of the lab text)

| Script | Purpose |
|--------|---------|
| `scripts/check_environment.sh` | Checks that the required tools exist in the VM |
| `scripts/backup_capture.sh` | Copies `capture.pcap` to `backup/` with a timestamp and checksum |
