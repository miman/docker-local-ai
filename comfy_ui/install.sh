#!/bin/bash

# Check if the ComfyUI folder exists; if so, pull the latest changes, otherwise clone it
if [ -d "ComfyUI" ]; then
  echo "ComfyUI folder exists -> pulling the latest changes..."
  cd ComfyUI
  git pull
  cd ..
else
  echo "ComfyUI folder does not exist -> cloning repo from GitHub..."
  git clone https://github.com/comfyanonymous/ComfyUI.git
fi

# Stop any running ComfyUI container
echo "Stopping existing ComfyUI container if it exists..."
docker-compose down

# Build the Docker image with the latest code
echo "Building ComfyUI Docker image..."
docker-compose build

# Start the ComfyUI container in detached mode
echo "Starting ComfyUI Docker container..."
docker-compose up -d

echo "ComfyUI has been installed and is accessible on http://localhost:4515"

# Prompt the user if they want to download models
read -p "Do you want to download models for ComfyUI ? (y/N): " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "Models will be downloaded..."
    # Check if download-models.sh exists and is executable
    if [ -x "download-models.sh" ]; then
        ./download-models.sh
    else
        echo "Warning: download-models.sh not found or not executable."
    fi
else
    echo "No models will be downloaded."
fi

echo "Find the model ranking here:  https://imgsys.org"
echo "Find & download them here:  https://civitai.com/models"