#!/usr/bin/env bash
# check_environment.sh
# Optional pre-check: verifies the tools and lab files used by the lab exist.
# Run in the CyberOps Workstation VM terminal.

LAB_SCRIPTS="/home/analyst/lab.support.files/scripts"
missing=0

echo "== Checking required tools =="
for tool in tcpdump wireshark firefox man sudo; do
    if command -v "$tool" >/dev/null 2>&1; then
        echo "[ OK ] $tool"
    else
        echo "[MISS] $tool"
        missing=1
    fi
done

echo
echo "== Checking lab support files =="
for f in "$LAB_SCRIPTS/cyberops_topo.py" "$LAB_SCRIPTS/reg_server_start.sh"; do
    if [ -e "$f" ]; then
        echo "[ OK ] $f"
    else
        echo "[MISS] $f"
        missing=1
    fi
done

echo
if [ "$missing" -eq 0 ]; then
    echo "Environment looks ready."
else
    echo "Some items are missing. Make sure you are inside the CyberOps Workstation VM."
fi
exit "$missing"
