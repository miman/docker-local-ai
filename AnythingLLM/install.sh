#!/bin/bash
# Ensure the docker network "local-ai-network" exists
if ! docker network ls --filter name=local-ai-network --format '{{.Name}}' | grep -q "^local-ai-network$"; then
  docker network create local-ai-network
else
  echo "The network local-ai-network already exists."
fi


echo "Deploying AnythingLLM Docker container..."
docker-compose down
docker-compose pull
docker-compose $COMPOSE_PART up -d --force-recreate --build

echo "AnythingLLM has been installed and is accessible on http://localhost:4513"
