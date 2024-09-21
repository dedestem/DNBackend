#!/bin/bash
echo "-----------------------------"
echo "Hello!"
docker pull amazoncorretto:21-alpine
echo "Checking if PreServer exists"
if [ -d "./PreServer" ]; then
	echo "It does!"
	echo "Building docker container"
	docker-compose build --no-cache
	echo "-----------------------------"
	echo "Starting the Docker container!"
	docker-compose up -d
	echo "Container started"
	echo "-----------------------------"
	echo "To stop run: bash Stop.sh"
else
	echo "It doesnt exist!"
fi
