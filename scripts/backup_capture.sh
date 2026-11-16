#!/usr/bin/env bash
# backup_capture.sh
# Optional helper: copy your capture file into backup/ with a timestamp and checksum.
#
# Usage:
#   ./scripts/backup_capture.sh                          # backs up /home/analyst/capture.pcap
#   ./scripts/backup_capture.sh /path/to/capture.pcap    # backs up another path
#
# The backup goes to <repo>/backup/ and a copy to <repo>/evidence/capture/.

set -euo pipefail

SOURCE="${1:-/home/analyst/capture.pcap}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
BACKUP_DIR="$REPO_DIR/backup"
EVIDENCE_DIR="$REPO_DIR/evidence/capture"
STAMP="$(date +%Y%m%d-%H%M%S)"

if [ ! -f "$SOURCE" ]; then
    echo "Capture file not found: $SOURCE" >&2
    exit 1
fi

mkdir -p "$BACKUP_DIR" "$EVIDENCE_DIR"

BACKUP_FILE="$BACKUP_DIR/capture-$STAMP.pcap"
cp "$SOURCE" "$BACKUP_FILE"
cp "$SOURCE" "$EVIDENCE_DIR/capture.pcap"
sha256sum "$BACKUP_FILE" | tee "$BACKUP_FILE.sha256"

echo "Backup saved:   $BACKUP_FILE"
echo "Evidence copy:  $EVIDENCE_DIR/capture.pcap"
