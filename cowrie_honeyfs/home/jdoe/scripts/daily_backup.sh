#!/bin/bash
# Simple script to backup website files
# Last updated: 2025-05-10 by jdoe

BACKUP_SRC="/var/www/html/"
BACKUP_DEST="/mnt/remote_backups/website_$(date +%Y%m%d_%H%M%S).tar.gz"

"Starting website backup..."
# tar -czf $BACKUP_DEST $BACKUP_SRC
"Backup command is currently commented out."
"Files would be backed up from $BACKUP_SRC to $BACKUP_DEST"

"Backup process finished."
