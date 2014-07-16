#!/bin/sh
echo "init apt-get..."

ORIGINAL_FILE=/etc/apt/sources.list
BACKUP_FILE=/etc/apt/.sources.list
NEW_FILE=eip_vm_files/sources.list

sudo cp -v $ORIGINAL_FILE $BACKUP_FILE
sudo cp -v $NEW_FILE $ORIGINAL_FILE

echo "...Done"