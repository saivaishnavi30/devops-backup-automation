# DevOps Automated Backup & Disaster Recovery

## Overview
A DevOps automation project that schedules, monitors, and logs 
cloud backups using Bash scripting and Google Cloud Platform.

## Tools Used
- Google Cloud Storage (GCS)
- gcloud CLI
- Bash Scripting
- Cron (Automated Scheduler)
- Ubuntu (WSL)

## Automation Features
- Scheduled daily backups everyday using cron
- Timestamped backup files for version tracking
- Success/failure verification after every backup
- Full audit log maintained in backup.log
- One-command disaster recovery via restore.sh

## Scripts
- backup.sh → Automated backup with error handling and logging
- restore.sh → Disaster recovery script to restore from GCS

## How to Run
### Manual Backup
bash backup.sh

### Restore After Disaster
bash restore.sh

### View Logs
cat ~/backup.log

### Check Scheduled Job
crontab -l


