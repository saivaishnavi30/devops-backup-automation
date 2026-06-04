#!/bin/bash

# ─── Config ───────────────────────────────────────
export PATH=$PATH:/home/vaishu/google-cloud-sdk/bin
BUCKET="gs://vaishu-backup-project-2026"
BACKUP_DIR="/home/$(whoami)/backup-data"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
LOG_FILE="/home/$(whoami)/backup.log"

# ─── Create backup folder if not exists ───────────
mkdir -p "$BACKUP_DIR"

# ─── Create a sample file to back up ──────────────
echo "Backup run at $DATE" > "$BACKUP_DIR/backup-$DATE.txt"

# ─── Upload to GCS ────────────────────────────────
echo "[$DATE] Starting backup..." >> "$LOG_FILE"
gcloud storage cp "$BACKUP_DIR/backup-$DATE.txt" "$BUCKET/backups/" >> "$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
    echo "[$DATE] Backup SUCCESS!" >> "$LOG_FILE"
    echo "Backup successful!"
else
    echo "[$DATE] Backup FAILED!" >> "$LOG_FILE"
    echo "ERROR: Backup failed! Check $LOG_FILE"
fi

echo "[$DATE] Backup complete!" >> "$LOG_FILE"
echo "Done! File uploaded to $BUCKET/backups/"
