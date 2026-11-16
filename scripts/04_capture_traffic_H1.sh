#!/usr/bin/env bash
# 04_capture_traffic_H1.sh
# Lab: Part 1, step g - Capture 50 packets on H1 to capture.pcap.
# Run in the H1 xterm window AFTER Firefox has opened.
#
# Then, quickly browse to 172.16.0.40 in Firefox (step h).
#
# Manual equivalent:
#   sudo tcpdump -i H1-eth0 -v -c 50 -w /home/analyst/capture.pcap

set -euo pipefail

INTERFACE="H1-eth0"
COUNT=50
OUTPUT="/home/analyst/capture.pcap"

echo "Capturing $COUNT packets on $INTERFACE -> $OUTPUT"
echo "Now browse to 172.16.0.40 in Firefox."
sudo tcpdump -i "$INTERFACE" -v -c "$COUNT" -w "$OUTPUT"
