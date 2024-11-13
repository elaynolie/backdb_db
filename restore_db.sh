#!/bin/bash

DB_NAME="kamailio"                  
DB_USER="root"                      
BACKUP_DIR="/tmp/"         


LATEST_BACKUP=$(ls -t "$BACKUP_DIR"/kamailio_backup_*.sql | head -n 1)

if [[ -f "$LATEST_BACKUP" ]]; then
    echo "Restore from last dump: $LATEST_BACKUP"
    
    mysql -u "$DB_USER" "$DB_NAME" < "$LATEST_BACKUP"
    

    echo "[$(date +'%F %T')] database recovery $DB_NAME from $LATEST_BACKUP complete" >> /var/log/restore_kamailio.log
else
    echo "Error: dump file not found in $BACKUP_DIR" >> /var/log/restore_kamailio.log
fi

