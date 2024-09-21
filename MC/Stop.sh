#!/bin/bash

# Define your container name
CONTAINER_NAME="mcserver"

# Create a timestamp for the backup directory
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="Backups/backup_$TIMESTAMP"

# Create the backup directory
mkdir -p "$BACKUP_DIR"

# Stop the container
echo "Stopping container..."
docker-compose stop "$CONTAINER_NAME"

# Back up the container
echo "Backing up container..."
docker cp "$CONTAINER_NAME:/Server" "$BACKUP_DIR"

# Create latest_backup.txt
echo "$BACKUP_DIR" > Backups/latest_backup.txt

# Delete the container
echo "Deleting container..."
docker-compose down -v

# Optionally, remove any unused Docker resources
echo "Removing unused Docker resources..."
docker system prune -f

# Rclone backup to OneDrive
echo "Starting OneDrive Backup..."
rclone copy "$BACKUP_DIR" "Onedrive:Samenwerken David En Papa/davidnet/Backups/MinecraftServerV2/backup_$TIMESTAMP" --progress

echo "Backup and cleanup complete. Backup stored in $BACKUP_DIR."
