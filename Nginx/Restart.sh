#!/bin/bash

# Check if the script is being run with sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run with sudo." >&2
    exit 1
fi

# Define the directories and repositories
declare -A REPOS=(
    ["/var/www/Web1"]="https://github.com/dedestem/Web1"
    ["/var/www/Web2"]="https://github.com/dedestem/Web2"
)

# Stop Nginx
echo "Stopping Nginx..."
sudo systemctl stop nginx || { echo "Failed to stop Nginx"; exit 1; }

# Remove existing directories and clone new repositories
for DIR in "${!REPOS[@]}"; do
    if [ -d "$DIR" ]; then
        echo "Removing existing $(basename "$DIR") directory..."
        sudo rm -rf "$DIR" || { echo "Failed to remove $(basename "$DIR")"; exit 1; }
    fi
    echo "Cloning $(basename "$DIR")..."
    sudo git clone "${REPOS[$DIR]}" "$DIR" || { echo "Failed to clone $(basename "$DIR")"; exit 1; }
done

# Start Nginx
echo "Starting Nginx..."
sudo systemctl start nginx || { echo "Failed to start Nginx"; exit 1; }

echo "Cloning and starting completed successfully."
