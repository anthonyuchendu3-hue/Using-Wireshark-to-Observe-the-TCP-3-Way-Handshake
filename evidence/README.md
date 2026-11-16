# evidence/

Non-screenshot proof and results from your run of the lab.

| Folder / file | Purpose |
|---------------|---------|
| `capture/` | Your `capture.pcap` created by `tcpdump` (copy it here from `/home/analyst/`) |
| `tcpdump-output/` | Text output of `tcpdump -r` (for example, `first-3-tcp-packets.txt`) |
| `wireshark-exports/` | Optional exports from Wireshark (for example, packet details of frames 1-3) |
| `answers/lab-answers.md` | Your answers to all lab questions |

Screenshots belong in [../screenshots/](../screenshots/README.md), not here.

## Saving tcpdump Output

```bash
tcpdump -r /home/analyst/capture.pcap tcp -c 3 > evidence/tcpdump-output/first-3-tcp-packets.txt
```

or use `scripts/06_view_capture_tcpdump.sh 3 evidence/tcpdump-output/first-3-tcp-packets.txt`.

Everything here should come from your own run of the lab. Nothing is pre-filled.
