#!/bin/bash

# Check if the script is being run with sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run with sudo." >&2
    exit 1
fi

# Define the directories
WEB1_DIR="/var/www/Web1"
WEB2_DIR="/var/www/Web2"

# Clone the repositories
echo "Cloning Web1..."
sudo git clone https://github.com/dedestem/Web1 "$WEB1_DIR" || { echo "Failed to clone Web1"; exit 1; }

echo "Cloning Web2..."
sudo git clone https://github.com/dedestem/Web2 "$WEB2_DIR" || { echo "Failed to clone Web2"; exit 1; }

# Reload Nginx
echo "restarting Nginx..."
sudo systemctl restart nginx || { echo "Failed to reload Nginx"; exit 1; }

echo "Cloning and restarting completed successfully."
