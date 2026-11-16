# EVIDENCE_CHECKLIST.md

Use this list to collect evidence **as you perform each step**. Tick a box only after you have the file saved in the repository. Naming rules are in [screenshots/README.md](screenshots/README.md).

Format: `partN-NN-description.png`, saved in the matching `screenshots/` subfolder.

---

## Part 1: Prepare the Hosts to Capture the Traffic
Folder: `screenshots/part1-prepare-hosts/`

| Done | Task | What the screenshot must show | Filename |
|------|------|-------------------------------|----------|
| [ ] | 1a/1b Start Mininet | Terminal with the command run and the `mininet>` prompt visible | `part1-01-mininet-started.png` |
| [ ] | 1c Open H1 and H4 | `xterm H1` / `xterm H4` entered and both xterm windows open | `part1-02-xterm-h1-h4-open.png` |
| [ ] | 1d Start web server | H4 window showing the `reg_server_start.sh` command run | `part1-03-h4-web-server-started.png` |
| [ ] | 1e/1f Switch user, start Firefox | H1 window showing `su analyst` and `firefox &` | `part1-04-h1-su-analyst-firefox.png` |
| [ ] | 1g Start capture | H1 window showing the `tcpdump ... -c 50 -w ...` command | `part1-05-h1-tcpdump-started.png` |
| [ ] | 1h Browse to the server | Firefox showing `172.16.0.40` in the address bar | `part1-06-firefox-172-16-0-40.png` |
| [ ] | 1g Capture finished | H1 window showing `50 packets captured` | `part1-07-h1-tcpdump-50-packets.png` |

## Part 2: Analyze the Packets using Wireshark
Folder: `screenshots/part2-wireshark-analysis/`

| Done | Task | What the screenshot must show | Filename |
|------|------|-------------------------------|----------|
| [ ] | 2.1a Start Wireshark | H1 window showing `wireshark &` | `part2-01-wireshark-started.png` |
| [ ] | 2.1b Open capture | Wireshark with `capture.pcap` loaded | `part2-02-capture-opened.png` |
| [ ] | 2.1c Apply `tcp` filter | Filter bar containing `tcp` and the first 3 handshake frames | `part2-03-tcp-filter-applied.png` |
| [ ] | 2.2 Frame 1 (SYN) | Packet details with **TCP > Flags** expanded: ports, flag, sequence number visible | `part2-04-frame1-syn-details.png` |
| [ ] | 2.2d Frame 2 (SYN, ACK) | Packet details with TCP expanded: ports, flags, sequence and ack numbers | `part2-05-frame2-synack-details.png` |
| [ ] | 2.2e Frame 3 (ACK) | Packet details with TCP expanded: flag, sequence and ack numbers | `part2-06-frame3-ack-details.png` |

## Part 3: View the Packets using tcpdump
Folder: `screenshots/part3-tcpdump/`

| Done | Task | What the screenshot must show | Filename |
|------|------|-------------------------------|----------|
| [ ] | 3a man page | `man tcpdump` with the `-r` switch description visible | `part3-01-man-tcpdump-r-switch.png` |
| [ ] | 3b Read capture | Output of `tcpdump -r ... tcp -c 3` (the three handshake packets) | `part3-02-tcpdump-read-3-packets.png` |

## Cleanup
Folder: `screenshots/part4-cleanup/`

| Done | Task | What the screenshot must show | Filename |
|------|------|-------------------------------|----------|
| [ ] | 3c Quit Mininet | `quit` and the `*** Done` output | `part4-01-mininet-quit.png` |
| [ ] | 3d Clean up | `sudo mn -c` run and completed | `part4-02-mn-cleanup.png` |

---

## Non-screenshot Evidence

| Done | Item | Location |
|------|------|----------|
| [ ] | Your capture file | `evidence/capture/capture.pcap` |
| [ ] | `tcpdump -r` text output | `evidence/tcpdump-output/first-3-tcp-packets.txt` |
| [ ] | Completed answers to all lab questions | `evidence/answers/lab-answers.md` |
| [ ] | Backup copy of the capture | `backup/` (use `scripts/backup_capture.sh`) |
| [ ] | (Optional) Wireshark exports | `evidence/wireshark-exports/` |

## Lab Questions Coverage

| Question | Part | Answer recorded in `lab-answers.md` |
|----------|------|-------------------------------------|
| TCP source port number | 2.2c (frame 1) | [ ] |
| Classification of the source port | 2.2c (frame 1) | [ ] |
| TCP destination port number | 2.2c (frame 1) | [ ] |
| Classification of the destination port | 2.2c (frame 1) | [ ] |
| Flag(s) set | 2.2c (frame 1) | [ ] |
| Relative sequence number | 2.2c (frame 1) | [ ] |
| Source and destination ports | 2.2d (frame 2) | [ ] |
| Flags set | 2.2d (frame 2) | [ ] |
| Relative sequence and acknowledgment numbers | 2.2d (frame 2) | [ ] |
| Flag(s) set | 2.2e (frame 3) | [ ] |
| What `-r` does | 3a | [ ] |
| Reflection 1: three useful Wireshark filters | Reflection | [ ] |
| Reflection 2: other uses of Wireshark | Reflection | [ ] |

## Before You Commit

- [ ] Every screenshot is your own and was taken during your own run of the lab
- [ ] No unrelated personal information is visible in screenshots
- [ ] File names follow the convention
- [ ] README progress tracker updated to match reality
