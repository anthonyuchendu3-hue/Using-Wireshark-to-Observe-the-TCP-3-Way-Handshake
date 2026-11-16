# backup/

Timestamped backups of your capture file so you do not lose it if the VM is reset.

The CyberOps VM may be reverted or deleted, and `capture.pcap` lives inside it. Copy it out soon after the capture finishes.

## Create a backup

From the repository root:

```bash
./scripts/backup_capture.sh
```

This creates:

- `backup/capture-YYYYMMDD-HHMMSS.pcap`: the backup copy
- `backup/capture-YYYYMMDD-HHMMSS.pcap.sha256`: its checksum
- `evidence/capture/capture.pcap`: the working evidence copy

Or manually:

```bash
cp /home/analyst/capture.pcap backup/capture-$(date +%Y%m%d-%H%M%S).pcap
```

## Verify a backup

```bash
sha256sum -c backup/capture-YYYYMMDD-HHMMSS.pcap.sha256
```

The folder ships empty (only `.gitkeep`).
