#!/bin/sh
echo "Hello"
pwd
ls
echo "------------------"
cd Server
pwd
ls
echo "------------------"

STOPMC() {
  echo "Requesting MC Stop"
  screen -S mc-server -p 0 -X stuff "stop$(printf \\r)"
  echo "Requested MC Stop"
  echo "Shutdown wait period will die over 110 seconds"
  sleep 110
  echo "Died off"
}

trap STOPMC SIGTERM
echo "SIGTERM Registered"

# Create the EULA file
echo "eula=true" > eula.txt
if [ $? -ne 0 ]; then
  echo "Failed to create EULA file"
  exit 1
fi
echo "Accepted MC Eula"

# Start the server
echo "Attempting to start server"
screen -S mc-server -dm java -Xms3G -Xmx3G -jar paper.jar --nogui
sleep 5
echo "Listing Screens"
screen -ls

# Keep the script running
while :; do
  sleep 5
done
