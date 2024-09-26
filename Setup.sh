#!/bin/sh
# DESIGNED FOR UBUNTU

# Check if ran with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Dit script moet als root worden uitgevoerd. Gebruik 'sudo'."
    exit 1
fi

# Install curl and git
sudo apt update
sudo apt install curl
sudo apt install git
sudo apt install screen

# Add Docker Repo + Keys
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install Docker
sudo apt update
sudo apt install docker-ce

# Configure Docker
sudo usermod -aG docker $USER

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Tools
sudo apt update
sudo apt install micro
sudo apt install rclone

# Install node and npm
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Install NGINX and certbot
sudo apt install nginx
sudo apt install certbot