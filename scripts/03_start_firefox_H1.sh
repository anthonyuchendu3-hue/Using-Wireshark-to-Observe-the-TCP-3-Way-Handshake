#!/usr/bin/env bash
# 03_start_firefox_H1.sh
# Lab: Part 1, steps e-f - Start Firefox on H1 as the analyst user.
# Run in the H1 xterm window (opened with "xterm H1" in Mininet).
#
# Firefox cannot run as root, so this switches to the analyst user first.
# Manual equivalent:
#   su analyst
#   firefox &

if [ "$(id -u)" -eq 0 ]; then
    su analyst -c "firefox >/dev/null 2>&1 &"
else
    firefox >/dev/null 2>&1 &
fi

echo "Firefox is starting (this can take a few moments)."
echo "Start the capture next (04_capture_traffic_H1.sh), then browse to 172.16.0.40."
