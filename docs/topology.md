# Mininet Topology

## Diagram

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

## Addressing

| Device | Network | Address | Role in this lab |
|--------|---------|---------|------------------|
| H1 | 10.0.0.0/24 | 10.0.0.11 | Client: Firefox, `tcpdump`, Wireshark |
| H2 | 10.0.0.0/24 | 10.0.0.12 | Not used in this lab |
| H3 | 10.0.0.0/24 | 10.0.0.13 | Not used in this lab |
| R1 (LAN side) | 10.0.0.0/24 | 10.0.0.1 | Default gateway for H1-H3 |
| R1 (server side) | 172.16.0.0/12 | 172.16.0.1 | Gateway for H4 |
| H4 | 172.16.0.0/12 | 172.16.0.40 | Web server |
| S1 | n/a | n/a | Switch for H1, H2, H3, and R1 |

## Interface Used for Capture

`H1-eth0` is the interface on H1 that `tcpdump` listens on.
