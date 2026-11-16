# Lab Overview

**Lab:** Using Wireshark to Observe the TCP 3-Way Handshake (9.2.6)
**Source:** Cisco Networking Academy, CyberOps
**Environment:** CyberOps Workstation virtual machine with Mininet

## Scenario

When an application such as HTTP or FTP starts on a host, TCP uses a three-way handshake to establish a reliable session between two hosts. In this lab, a browser on H1 requests a web page from a web server on H4, and the resulting handshake is captured and examined. A PC can have many simultaneous TCP sessions with different websites.

## Objectives

1. **Part 1:** Prepare the hosts to capture the traffic
2. **Part 2:** Analyze the packets using Wireshark
3. **Part 3:** View the packets using `tcpdump`

## Required Resources

- CyberOps Workstation virtual machine

## Lab Account

The lab instructions use the VM's default account: user `analyst` (the lab text gives the password). Use only inside the lab VM.

## Task Summary

### Part 1: Prepare the Hosts

| Step | Task | Where |
|------|------|-------|
| a | Start the CyberOps VM and log in | VM |
| b | Start Mininet with `cyberops_topo.py` | VM terminal |
| c | Open xterm windows for H1 and H4 | Mininet CLI |
| d | Start the web server with `reg_server_start.sh` | H4 |
| e | Switch from root to `analyst` with `su analyst` | H1 |
| f | Start Firefox with `firefox &` | H1 |
| g | Start `tcpdump`, writing 50 packets to `capture.pcap` | H1 |
| h | Browse to `172.16.0.40` in Firefox | H1 |

### Part 2: Analyze the Packets using Wireshark

| Step | Task |
|------|------|
| 1a | Start Wireshark on H1 (`wireshark &`) and accept the superuser warning |
| 1b | Open `/home/analyst/capture.pcap` |
| 1c | Apply the `tcp` filter |
| 2a-c | Examine frame 1: source/destination port, port classification, flags, relative sequence number |
| 2d | Examine frame 2: ports, flags, relative sequence and acknowledgment numbers |
| 2e | Examine frame 3: flags |

### Part 3: View the Packets using tcpdump

| Step | Task |
|------|------|
| a | Open `man tcpdump` and find what the `-r` switch does |
| b | Run `tcpdump -r /home/analyst/capture.pcap tcp -c 3` |
| c | Quit Mininet (`quit`) |
| d | Run `sudo mn -c` to clean up |

### Reflection Questions

1. List three Wireshark filters that might be useful to a network administrator.
2. What other ways could Wireshark be used in a production network?

## Files Used by the Lab

| Path (in the CyberOps VM) | Purpose |
|---------------------------|---------|
| `/home/analyst/lab.support.files/scripts/cyberops_topo.py` | Builds the Mininet topology |
| `/home/analyst/lab.support.files/scripts/reg_server_start.sh` | Starts the web server on H4 |
| `/home/analyst/capture.pcap` | Capture file created by `tcpdump` |
