# screenshots/

Place **your own** screenshots here as proof that you performed each step of the lab. This repository intentionally ships with no screenshots; the folders contain only `.gitkeep` placeholders.

## Folder Layout

| Folder | Contents |
|--------|----------|
| `part1-prepare-hosts/` | Mininet, xterm, web server, Firefox, `tcpdump` capture |
| `part2-wireshark-analysis/` | Wireshark: opened capture, `tcp` filter, frames 1-3 with TCP details |
| `part3-tcpdump/` | `man tcpdump` (`-r` switch) and `tcpdump -r` output |
| `part4-cleanup/` | Quitting Mininet and `sudo mn -c` |

## Naming Convention

```
part<N>-<NN>-<short-description>.png
```

- `part<N>`: lab part number (`part1`, `part2`, `part3`, `part4` for cleanup)
- `<NN>`: two-digit sequence number, in the order you took them
- `<short-description>`: lowercase words separated by hyphens
- Use `.png`

Examples:

```
part1-01-mininet-started.png
part2-04-frame1-syn-details.png
part3-02-tcpdump-read-3-packets.png
part4-02-mn-cleanup.png
```

The full list of expected screenshots is in [../EVIDENCE_CHECKLIST.md](../EVIDENCE_CHECKLIST.md).

## Tips for Good Screenshots

- Show the **command and its output** together
- In Wireshark, expand **Transmission Control Protocol** and **Flags** so ports, flags, and numbers are readable
- Keep the window title or prompt visible (for example, `Node: H1`) so it is clear which host you used
- Crop out anything unrelated to the lab
- Do not edit or annotate screenshots in ways that change their content

## Removing Placeholders

You may delete a `.gitkeep` once its folder contains real files. It is harmless to keep.
