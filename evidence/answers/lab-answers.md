# Lab Answers

Fill these in from **your own capture**. Leave a question blank until you have actually examined the packet. Your values will differ from the examples in the lab document.

- Date completed: 2026-11-16
- Frame numbers used for the handshake: 1 / 2 / 3

---

## Part 2: Analyze the Packets using Wireshark

### Frame 1 (the first packet of the handshake)

| Question | Answer |
|----------|--------|
| What is the TCP source port number? | 58716 |
| How would you classify the source port? | Dynamic / private / ephemeral port (range 49152–65535) |
| What is the TCP destination port number? | 80 |
| How would you classify the destination port? | Well-known port (HTTP) |
| Which flag (or flags) is set? | SYN |
| What is the relative sequence number set to? | 0 |

### Frame 2 (the server's reply)

| Question | Answer |
|----------|--------|
| What are the values of the source and destination ports? | Source: 80, Destination: 58716 |
| Which flags are set? | SYN, ACK |
| What are the relative sequence and acknowledgment numbers set to? | Sequence = 0, Acknowledgment = 1 |

### Frame 3 (the final packet of the handshake)

| Question | Answer |
|----------|--------|
| Which flag (or flags) is set? | ACK |

---

## Part 3: View the Packets using tcpdump

| Question | Answer |
|----------|--------|
| What does the switch `-r` do? | Reads packets from a saved capture file instead of capturing live traffic from an interface. |

---

## Reflection Questions

**1. There are hundreds of filters available in Wireshark. A large network could have numerous filters and many different types of traffic. List three filters that might be useful to a network administrator.**

> 1. `http` — isolates web traffic for troubleshooting web applications and spotting unencrypted data.
> 2. `dns` — shows DNS queries and responses, useful for diagnosing name-resolution failures or detecting DNS tunneling.
> 3. `ip.addr == 192.168.1.50` — filters all traffic to/from a specific host for investigating a suspicious or problematic machine.

**2. What other ways could Wireshark be used in a production network?**

> Wireshark can be used for troubleshooting connectivity and performance issues (retransmissions, latency, dropped packets), security monitoring and incident response (detecting malware C2 traffic, port scans, ARP spoofing, cleartext credentials), protocol analysis and validation, baseline traffic analysis to spot anomalies, VoIP/QoS analysis, forensic review of saved .pcap files, compliance auditing to verify encryption, application debugging, capacity planning, and education/training on protocol behavior.