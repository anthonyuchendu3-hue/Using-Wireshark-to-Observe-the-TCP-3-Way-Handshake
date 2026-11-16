#!/usr/bin/env bash
# 02_start_web_server_H4.sh
# Lab: Part 1, step d - Start the web server on H4.
# Run in the H4 xterm window (opened with "xterm H4" in Mininet).

set -euo pipefail

SERVER_SCRIPT="/home/analyst/lab.support.files/scripts/reg_server_start.sh"

if [ ! -x "$SERVER_SCRIPT" ]; then
    echo "Cannot find or execute $SERVER_SCRIPT" >&2
    exit 1
fi

"$SERVER_SCRIPT"
