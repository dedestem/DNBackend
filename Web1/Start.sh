#!/bin/bash
echo "Hello"
echo "Checking if ROOT Exists"
if [ -d "ROOT" ]; then
  rm -rf ROOT
  echo "Old ROOT deleted"
fi
mkdir ROOT

echo "Downloading newest Web1 version"
cd ROOT
git clone https://github.com/dedestem/Web1 .
cd ..

echo "Updating docker from"
docker pull nginx:alpine

echo "Starting Container"
docker-compose up -d
