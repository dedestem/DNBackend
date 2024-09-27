#!/bin/sh
if [ "$EUID" -ne 0 ]; then
    echo "Dit script moet als root worden uitgevoerd. Gebruik 'sudo'."
    exit 1
fi

cd "$(dirname "$0")"

cd MC
bash Stop.sh
cd ..

cd DB1
bash Stop.sh
cd ..

echo "Reboot planned over 20 seconds"
sleep 20 # Níet nodig maar geef het wat extra tijd

echo "Rebooting"
sudo reboot