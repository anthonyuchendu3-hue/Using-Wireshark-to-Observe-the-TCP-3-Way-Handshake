#!/usr/bin/env bash
# 01_start_mininet.sh
# Lab: Part 1, step b - Start Mininet.
# Run in the CyberOps Workstation VM terminal (as user analyst).
#
# After the "mininet>" prompt appears, type these yourself:
#   mininet> xterm H1
#   mininet> xterm H4
# When you have finished the lab, type:  quit

set -euo pipefail

TOPO_SCRIPT="/home/analyst/lab.support.files/scripts/cyberops_topo.py"

if [ ! -x "$TOPO_SCRIPT" ]; then
    echo "Cannot find or execute $TOPO_SCRIPT" >&2
    echo "Are you inside the CyberOps Workstation VM?" >&2
    exit 1
fi

sudo "$TOPO_SCRIPT"
