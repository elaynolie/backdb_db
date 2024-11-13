#!/bin/bash

DB_NAME="kamailio"
DB_USER="root"
REMOTE_USER="root"
REMOTE_HOST="192.168.216.101"
REMOTE_PATH="/tmp/"
TIMESTAMP=$(date +%F_%H-%M)
FILE_NAME="kamailio_backup_$TIMESTAMP.sql"

mysqldump -u "$DB_USER" "$DB_NAME" | ssh "$REMOTE_USER@$REMOTE_HOST" "cat > $REMOTE_PATH/$FILE_NAME"

echo "[$(date +'%F %T')] Backup $FILE_NAME created and sent to $REMOTE_HOST:$REMOTE_PATH" >> /var/log/backup_kamailio.log
