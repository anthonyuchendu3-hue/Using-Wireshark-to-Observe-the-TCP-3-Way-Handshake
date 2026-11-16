#!/usr/bin/env bash
# 06_view_capture_tcpdump.sh
# Lab: Part 3, step b - Read TCP packets from the saved capture with tcpdump.
#
# Usage:
#   ./06_view_capture_tcpdump.sh                 # first 3 TCP packets (as in the lab)
#   ./06_view_capture_tcpdump.sh 10              # first 10 TCP packets
#   ./06_view_capture_tcpdump.sh 3 out.txt       # also save the output to a file
#
# Manual equivalent:
#   tcpdump -r /home/analyst/capture.pcap tcp -c 3

set -euo pipefail

CAPTURE="${CAPTURE:-/home/analyst/capture.pcap}"
COUNT="${1:-3}"
SAVE_TO="${2:-}"

if [ ! -f "$CAPTURE" ]; then
    echo "Capture file not found: $CAPTURE" >&2
    echo "Run the capture step first (04_capture_traffic_H1.sh)." >&2
    exit 1
fi

if [ -n "$SAVE_TO" ]; then
    tcpdump -r "$CAPTURE" tcp -c "$COUNT" | tee "$SAVE_TO"
else
    tcpdump -r "$CAPTURE" tcp -c "$COUNT"
fi
