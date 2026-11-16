# Troubleshooting

| Problem | Likely cause | What to try |
|---------|--------------|-------------|
| Firefox will not start on H1 | Running as `root` | In the H1 xterm run `su analyst`, then `firefox &` |
| Firefox is slow to appear | Normal on first start | Wait a few moments |
| Capture has no handshake packets | Browsed to the server before `tcpdump` started, or `-c 50` already filled with other traffic | Start `tcpdump` first, then quickly browse to `172.16.0.40`; re-run if needed |
| `tcpdump` stops by itself | `-c 50` limits the capture to 50 packets | Expected behavior |
| Page at `172.16.0.40` does not load | Web server not started on H4 | Run `reg_server_start.sh` in the H4 xterm |
| `tcpdump: permission denied` | Missing privileges | Use `sudo` for capture commands |
| Wireshark warns about superuser | Wireshark started with elevated rights | Click **OK**, as the lab instructs |
| Wireshark window layout is cramped | Pane sizes | Drag the pane dividers to enlarge the packet details pane |
| Only a few lines from `tcpdump -r` | `-c 3` limits output | Increase the number after `-c` to see more packets |
| Mininet errors on next start | Leftover processes from a previous run | Quit Mininet, then run `sudo mn -c` |
| `capture.pcap` missing | Capture did not run or path differs | Check `ls -l /home/analyst/capture.pcap` |
