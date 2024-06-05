#!/bin/bash

CURRENT_DATE=$(date "+%Y-$m-%d-%H:%M:%S")
BACKUP_DIR_NAME="backup_${CURRENT_DATE}"

pg_ctl stop -D $HOME/qkl81

rsync -avv $HOME $HOME/qkl81/pg_wal postgres1@pg108:~/backups/$BACKUP_DIR_NAME

postgres -D $HOME/qkl81 >~/logfile 2>&1 &

ssh postgres1@pg108 "bash /var/db/postgres1/remove_script.sh"

echo "$(date): Backup $BACKUP_DIR_NAME was successfully created in directory ~/backups"