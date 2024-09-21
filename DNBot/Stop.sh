#!/bin/bash
# Delete the container
echo "Deleting container..."
docker-compose down -v

# Optionally, remove any unused Docker resources
echo "Removing unused Docker resources..."
docker system prune -f