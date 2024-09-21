#!/bin/bash
echo "Hello"

echo "Checking if DNBot Exists"
if [ -d "DNBot" ]; then
  rm -rf DNBot
  echo "Old DNBot deleted"
fi

echo "Downloading newest DNBot version"
git clone https://github.com/dedestem/DNBot/

echo "Cloning Config"
cp Config.json DNBot/Config.json

echo "Bye. Say hello to Run.sh"
cd DNBot
bash Run.sh