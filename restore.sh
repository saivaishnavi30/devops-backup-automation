#!/bin/bash

# ─── Config ──────────────────────────────────────
export PATH=$PATH:/home/vaishu/google-cloud-sdk/bin
BUCKET="gs://vaishu-backup-project-2026"
RESTORE_DIR="/home/$(whoami)/restored-data"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
LOG_FILE="/home/$(whoami)/backup.log"

# ─── Create restore folder ────────────────────────
mkdir -p "$RESTORE_DIR"

# ─── Download files from GCS ──────────────────────
echo "[$DATE] Starting restore..." >> "$LOG_FILE"
gcloud storage cp "$BUCKET/backups/*" "$RESTORE_DIR/" >> "$LOG_FILE" 2>&1

echo "[$DATE] Restore complete!" >> "$LOG_FILE"
echo "Done! Files restored to $RESTORE_DIR"
