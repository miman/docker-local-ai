#!/bin/bash
# filepath: /c:/code/mt/docker-local-ai/ollama/install.sh

# Ensure the docker network "local-ai-network" exists
if ! docker network ls --filter name=local-ai-network --format '{{.Name}}' | grep -q "^local-ai-network$"; then
  docker network create local-ai-network
else
  echo "The network local-ai-network already exists."
fi

# Prompt for Ollama UI installation
read -p "Do you want to install the Ollama UI (y/N)? " answer
echo "Deploying Docker container..."
if [[ "${answer,,}" == "y" ]]; then
  docker-compose down
  docker-compose pull
  docker-compose up -d --force-recreate --build
else
  docker-compose down
  docker-compose pull ollama-container
  docker-compose up -d --force-recreate --build ollama-container
fi

echo "Ollama has been installed and is accessible on http://localhost:4512"
echo "Find and download models here: https://ollama.com/library"

read -p "Do you want to install an ollama alias in your rc file so it maps to your docker ollama instance (y/N)? " answer_alias
if [[ "${answer_alias,,}" == "y" ]]; then
  echo "Added ollama alias..."
  ./add-ollama-alias.sh
fi

# Prompt for pulling the qwen2.5:3b model
read -p "Do you want to install qwen2.5:3b model into Ollama (y/N)? " answer_model
if [[ "${answer_model,,}" == "y" ]]; then
  echo "Installing qwen2.5:3b as a model in Ollama..."
  docker exec -it ollama ollama pull qwen2.5:3b
fi
