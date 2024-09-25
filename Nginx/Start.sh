#!/bin/bash
echo "Hello"
echo "Checking if nginx Exists"
if [ -d "nginx" ]; then
  rm -rf nginx
  echo "Old nginx deleted"
fi
mkdir -p nginx/conf.d nginx/vhost.d nginx/html nginx/certs

echo "Downloading newest Web1 version"
cd nginx/html
git clone https://github.com/dedestem/Web1 .
cd ..
cd ..

echo "Updating docker from"
docker pull nginx:alpine

echo "Building docker container"
docker-compose build --no-cache
echo "-----------------------------"
echo "Starting the Docker container!"
docker-compose up -d