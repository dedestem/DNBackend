#!/bin/bash
echo "Hello"
screen -S StateAPI -X quit

echo "Checking if StateAPI Exists"
if [ -d "StateAPI" ]; then
  rm -rf StateAPI
  echo "Old StateAPI deleted"
fi

echo "Downloading newest StateAPI version"
git clone https://github.com/dedestem/StateAPI/

cd StateAPI
echo "Installing NPM Dependencies"
npm install

echo "Bye. Say hello to Run.sh"
screen -S StateAPI -dm "./Run.sh"
