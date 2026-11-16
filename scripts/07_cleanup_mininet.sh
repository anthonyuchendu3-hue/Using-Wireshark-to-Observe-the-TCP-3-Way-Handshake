#!/usr/bin/env bash
# 07_cleanup_mininet.sh
# Lab: Part 3, step d - Clean up processes started by Mininet.
# Run in the CyberOps VM terminal AFTER typing "quit" at the mininet> prompt.
# You will be prompted for the sudo password.

set -euo pipefail

echo "Make sure you already typed 'quit' at the mininet> prompt."
sudo mn -c
