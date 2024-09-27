#!/bin/bash
echo "Resetting MySQL and phpMyAdmin services..."

# Stopt en verwijdert de containers
docker-compose down

# Verwijdert het volume om de database schoon te maken
docker volume rm $(docker volume ls -q --filter name=Data)