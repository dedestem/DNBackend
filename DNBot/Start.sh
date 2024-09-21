#!/bin/bash
echo "Building docker container"
docker-compose build
echo "Running the Docker container!"
docker-compose up