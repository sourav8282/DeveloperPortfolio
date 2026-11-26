#!/bin/bash

# Author: Sourav
# Backup Script

SOURCE="$1"
BACKUP_DIR="$HOME/DeveloperPortfolio_Backups"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"
LOG_FILE="$BACKUP_DIR/backup.log"

if [ -z "$SOURCE" ]; then
    echo "Error: Please provide a source folder."
    exit 1
fi

if [ ! -d "$SOURCE" ]; then
    echo "Error: Source folder does not exist."
    exit 1
fi

mkdir -p "$BACKUP_DIR"

if tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"; then
    SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
    echo "Backup successful: $BACKUP_FILE"
    echo "Backup size: $SIZE"
    echo "$(date): SUCCESS - $BACKUP_FILE ($SIZE)" >> "$LOG_FILE"
else
    echo "Backup failed."
    echo "$(date): FAILED - $SOURCE" >> "$LOG_FILE"
    exit 1
fi
