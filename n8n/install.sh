#!/bin/bash
# filepath: /c/code/mt/docker-local-ai/n8n/install.sh

set -e

echo "Checking for Docker network 'local-ai-network'..."
if ! docker network ls --filter name=local-ai-network --format "{{.Name}}" | grep -q "^local-ai-network$"; then
  docker network create local-ai-network
else
  echo "The network local-ai-network already exists."
fi

echo "Checking for Docker volume 'n8n_data'..."
if ! docker volume ls --filter name=n8n_data --format "{{.Name}}" | grep -q "^n8n_data$"; then
  docker volume create n8n_data
else
  echo "The volume n8n_data already exists."
fi

echo "Deploying Docker container..."
docker-compose down
docker-compose pull
docker-compose up -d --force-recreate --build

echo "Removing dangling Docker images..."
docker image prune -f