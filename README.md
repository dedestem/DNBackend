# DNBackend
Designed for ubuntu

> **⚠ Warning**<br> DNBackend isnt designed or configured to run outside of davidnet

### Setup
 - Clone
 
 - Get DNBot config file
 - Configure other configs

### SUDO Crontab
sudo crontab -e

0 0 * * 0 /usr/bin/certbot renew --quiet
