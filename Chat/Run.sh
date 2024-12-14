#!/bin/bash
echo "Hello"
screen -S ChatBackend -X quit

echo "Checking if Chat-Backend Exists"
if [ -d "Chat-Backend" ]; then
  rm -rf Chat-Backend
  echo "Old Chat-Backend deleted"
fi

echo "Downloading newest Chat-Backend version"
git clone https://github.com/dedestem/Chat-Backend/

cd Chat-Backend
echo "Installing NPM Dependencies"
npm install

echo "Bye. Say hello to Run.sh"
bash Run.sh
