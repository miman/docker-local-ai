#!/bin/bash
# filepath: /c:/code/mt/docker-local-ai/ollama/install.sh

# Ensure the docker network "local-ai-network" exists
if ! docker network ls --filter name=local-ai-network --format '{{.Name}}' | grep -q "^local-ai-network$"; then
  docker network create local-ai-network
else
  echo "The network local-ai-network already exists."
fi


# Prompt for Ollama UI installation
echo "Deploying Docker container..."
docker-compose down
docker-compose pull
docker-compose up -d --force-recreate --build

echo "Open-webui has been installed and is accessible on http://localhost:4512"
