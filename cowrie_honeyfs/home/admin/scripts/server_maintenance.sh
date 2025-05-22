#!/bin/bash
#
# Server Maintenance Script
# Author: System Admin <admin@companyserver.com>
# Last Modified: 2025-05-15
#
# This script performs routine checks and maintenance tasks.
# Run as root or with sudo.

echo "Starting server maintenance tasks..."
date

# 1. Check disk space
echo "[INFO] Checking disk space utilization..."
df -h /
df -h /var
df -h /home

# 2. Clean temporary files
echo "[INFO] Cleaning up /tmp and /var/tmp..."
# rm -rf /tmp/*
# rm -rf /var/tmp/*
echo "[WARN] Actual deletion of temp files is commented out for safety."

# 3. Check critical services status (example: web server, ssh)
echo "[INFO] Checking status of critical services..."
# systemctl status nginx # || echo "Nginx not found or not active."
# systemctl status sshd # || echo "SSHD not found or not active."
# systemctl status mysql # || echo "MySQL not found or not active."
echo "[INFO] Service status checks are illustrative. Add actual service checks as needed."

# 4. Check for recent errors in logs
echo "[INFO] Grepping for recent critical errors in syslog (last 100 lines)..."
# sudo tail -n 100 /var/log/syslog | grep -Ei 'critical|error|failure'
echo "[INFO] Log check example. Adjust grep pattern as needed."

# 5. Optional: Backup critical configuration files
# echo "[INFO] Backing up critical configurations..."
# BACKUP_DIR="/opt/backup_configs/$(date +%Y-%m-%d)"
# mkdir -p $BACKUP_DIR
# cp /etc/nginx/nginx.conf $BACKUP_DIR/nginx.conf.bak
# cp /etc/ssh/sshd_config $BACKUP_DIR/sshd_config.bak
# echo "[INFO] Config backup example. Specify actual files and secure backup location."

echo "Server maintenance tasks script finished."
date