# TCP Three-Way Handshake: Study Notes

Background notes to help you interpret your own capture. They are general TCP knowledge, not your results.

## The Three Steps

```
   Client (H1)                        Server (H4)
       |  ---- 1. SYN ------------------>  |   "I want to start a session"
       |  <--- 2. SYN, ACK --------------  |   "OK, and I want to start one too"
       |  ---- 3. ACK ------------------>  |   "Acknowledged. Session established"
```

| Frame | Sender | TCP flags | Purpose |
|-------|--------|-----------|---------|
| 1 | Client | SYN | Requests a session and proposes an initial sequence number |
| 2 | Server | SYN, ACK | Accepts, sends its own initial sequence number, acknowledges the client's |
| 3 | Client | ACK | Acknowledges the server's SYN; the session is established |

## Reading Flags

| Tool | SYN | SYN-ACK | ACK |
|------|-----|---------|-----|
| Wireshark packet details | `Flags: 0x002 (SYN)` | `Flags: 0x012 (SYN, ACK)` | `Flags: 0x010 (ACK)` |
| `tcpdump` output | `[S]` | `[S.]` | `[.]` |

In Wireshark, a flag value of `1` means the flag is set.

## Relative vs. Raw Sequence Numbers

Wireshark shows **relative** sequence numbers by default (starting at 0 for the first packet of each direction) to make them easier to read. `tcpdump` shows the **raw** values. The ACK number acknowledges the other side's sequence number plus one.

## Port Classes

| Range | Class |
|-------|-------|
| 0 - 1023 | Well-known (system) ports |
| 1024 - 49151 | Registered ports |
| 49152 - 65535 | Dynamic / private (ephemeral) ports |

Clients normally choose a random ephemeral source port; servers listen on a well-known port (for example, HTTP uses 80). Use this table to classify the ports you observe.

## Useful Filters (for the reflection questions)

These are starting points. Pick and explain the ones you find most useful.

| Filter | Shows |
|--------|-------|
| `tcp` | Only TCP traffic (used in this lab) |
| `ip.addr == 10.0.0.11` | Traffic to or from a host |
| `tcp.port == 80` | Traffic on a given TCP port |
| `tcp.flags.syn == 1` | Packets with the SYN flag set |
| `http` | HTTP traffic |

## Reference: Example Values Shown in the Lab Document

The lab's sample screenshots used the values below. **Your capture will differ**, especially the ephemeral source port and raw sequence numbers. Always answer from your own capture.

| Item | Lab example |
|------|-------------|
| Client / server | 10.0.0.11 / 172.16.0.40 |
| Client source port (example) | 58716 |
| Server port | 80 |
