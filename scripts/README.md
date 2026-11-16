# scripts/

Helper shell scripts that wrap the lab commands. They are meant to be run **inside the CyberOps Workstation VM**, in the place noted below.

Make them executable once:

```bash
chmod +x scripts/*.sh
```

| Script | Run where | What it does | Lab step |
|--------|-----------|--------------|----------|
| `check_environment.sh` | VM terminal | Checks that the tools and lab files exist (optional) | Pre-check |
| `01_start_mininet.sh` | VM terminal | Starts the Mininet topology | Part 1b |
| `02_start_web_server_H4.sh` | H4 xterm | Starts the web server | Part 1d |
| `03_start_firefox_H1.sh` | H1 xterm | Starts Firefox as `analyst` | Part 1e-f |
| `04_capture_traffic_H1.sh` | H1 xterm | Captures 50 packets to `capture.pcap` | Part 1g |
| `05_open_wireshark_H1.sh` | H1 xterm | Starts Wireshark | Part 2 step 1a |
| `06_view_capture_tcpdump.sh` | VM terminal | Reads the first packets from `capture.pcap` | Part 3b |
| `07_cleanup_mininet.sh` | VM terminal | Runs `sudo mn -c` after you quit Mininet | Part 3d |
| `backup_capture.sh` | VM terminal | Copies `capture.pcap` into `backup/` with a timestamp | Evidence |

## Notes

- Scripts do not replace understanding the commands. Read [COMMANDS.md](../COMMANDS.md) first.
- `01_start_mininet.sh` keeps running in the `mininet>` CLI; type `xterm H1` and `xterm H4` there manually, then `quit` when done.
- Nothing here is run automatically, and running a script does not count as completing the lab. Capture your own evidence.
