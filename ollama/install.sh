#!/bin/bash
# filepath: /c:/code/mt/docker-local-ai/ollama/install.sh

# Ensure the docker network "local-ai-network" exists
if ! docker network ls --filter name=local-ai-network --format '{{.Name}}' | grep -q "^local-ai-network$"; then
  docker network create local-ai-network
else
  echo "The network local-ai-network already exists."
fi

# Prompt for Ollama UI installation
read -p "Do you have an Nvidia GPU you want to use with Ollama (y/N)?  " answerNvidia
echo "Deploying Docker container..."
if [[ "$answerNvidia" =~ [Yy]$ ]]; then
  echo "Using Nvidia card in Ollama"
  COMPOSE_PART=-f docker-compose.yaml -f docker-compose-nvidia.yaml
else
  COMPOSE_PART=
fi
# echo "COMPOSE_PART = $COMPOSE_PART"

# Prompt for Ollama UI installation
read -p "Do you want to install the Ollama UI (y/N)? " answer
echo "Deploying Docker container..."
if [[ "$answer" =~ [Yy]$ ]]; then
  docker-compose down
  docker-compose pull
  docker-compose $COMPOSE_PART up -d --force-recreate --build
else
  docker-compose down
  docker-compose pull ollama-container
  docker-compose $COMPOSE_PART up -d --force-recreate --build ollama-container
fi

echo "Ollama has been installed and is accessible on http://localhost:4512"
echo "Find and download models here: https://ollama.com/library"

read -p "Do you want to install an ollama alias in your rc file so it maps to your docker ollama instance (y/N)? " answer_alias
if [[ "$answer_alias" =~ [Yy]$ ]]; then
  echo "Added ollama alias..."
  ./add-ollama-alias.sh
fi

# Prompt for pulling the models
read -p "Do you want to install granite3.1-dense:2b model into Ollama (y/N)? " answer_model
if [[ "$answer_model" =~ [Yy]$ ]]; then
  echo "Installing granite3.1-dense:2b as a model in Ollama..."
  docker exec -it ollama ollama pull granite3.1-dense:2b
fi

read -p "Do you want to be able to use image as input and install llava-phi3 model into Ollama (y/N)? " answer_model
if [[ "$answer_model" =~ [Yy]$ ]]; then
  echo "Installing llava-phi3 as a model in Ollama..."
  docker exec -it ollama ollama pull llava-phi3
fi
