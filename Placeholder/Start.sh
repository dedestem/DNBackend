#!/bin/bash
echo "Hello"
screen -S Placeholder -X quit

echo "Checking if StateAPI Exists"
if [ -d "Placeholder" ]; then
  rm -rf Placeholder
  echo "Old Placeholder deleted"
fi

echo "Downloading newest Placeholder version"
git clone https://github.com/dedestem/Placeholder/

cd Placeholder
cd back-end

echo "Installing pkg-config depedencies"
apt update
apt install -y build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev pkg-config

echo "Installing NPM Dependencies"
npm install

echo "Bye. Say hello to placeholder.js"
screen -S Placeholder -X quit
screen -dmS Placeholder node placeholder.js
