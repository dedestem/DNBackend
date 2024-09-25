#!/bin/bash
echo "Container deletion"
docker-compose down -v

echo "Container wipe"
docker system prune -f