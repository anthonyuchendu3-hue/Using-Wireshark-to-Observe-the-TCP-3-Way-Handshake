#!/usr/bin/env bash
# 05_open_wireshark_H1.sh
# Lab: Part 2, step 1a - Start Wireshark on H1.
# Run in the H1 xterm window.
#
# Click OK on the superuser warning, then in Wireshark:
#   File > Open > /home/analyst/capture.pcap
#   Apply the display filter:  tcp

wireshark &
echo "Wireshark is starting. Open /home/analyst/capture.pcap and apply the 'tcp' filter."
