#!/bin/bash
# filepath: /c:/code/mt/docker-local-ai/ollama/install.sh

# Ensure the docker network "local-ai-network" exists
if ! docker network ls --filter name=local-ai-network --format '{{.Name}}' | grep -q "^local-ai-network$"; then
  docker network create local-ai-network
else
  echo "The network local-ai-network already exists."
fi

echo "If you are using a MAC, you probably want to install Ollama locally & not as a Docker container while Mac cannot use the GPU in docker so it will be very slow".
# Prompt for Ollama installation
read -p "Do you have an Nvidia GPU you want to use with Ollama (y/N)?  " answerNvidia

if [[ "$answerNvidia" =~ [Yy]$ ]]; then
  # Check if nvidia-container-toolkit is installed
  if ! dpkg -l | grep -q "nvidia-container-toolkit"; then
    echo "--------------------------------------------------------------------------------"
    echo "ERROR: NVIDIA Container Toolkit not found!"
    echo "To use your GPU with Docker, you must install the NVIDIA Container Toolkit."
    echo "Follow the instructions here: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html"
    echo "Or run these commands (Ubuntu/Debian):"
    echo "  curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg"
    echo "  curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list"
    echo "  sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit"
    echo "  sudo nvidia-container-toolkit runtime configure --runtime=docker && sudo systemctl restart docker"
    echo "--------------------------------------------------------------------------------"
    read -p "Would you like to proceed anyway without GPU support? (y/N) " proceedWithoutGpu
    if [[ ! "$proceedWithoutGpu" =~ [Yy]$ ]]; then
      exit 1
    fi
    answerNvidia="n"
  fi
fi

echo "Deploying Docker container..."
if [[ "$answerNvidia" =~ [Yy]$ ]]; then
  echo "Using Nvidia card in Ollama"
  COMPOSE_PART="-f docker-compose.yaml -f docker-compose-nvidia.yaml"
else
  COMPOSE_PART=""
fi
# echo "COMPOSE_PART = $COMPOSE_PART"

# Prompt for Ollama UI installation
echo "Deploying Docker container..."
docker compose down
docker compose pull
docker compose $COMPOSE_PART up -d --force-recreate --build

echo "Ollama has been installed and is accessible on http://localhost:11434"
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
