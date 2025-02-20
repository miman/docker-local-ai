#!/bin/bash
# filepath: /c:/code/mt/docker-local-ai/comfy_ui/install.sh

set -e

# Create a volume for the ComfyUI Docker container
docker volume create local-comfyui-folder

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

echo "Copying the ComfyUI files to the Docker volume..."
# Create a temporary container to copy files into the volume
docker run --rm -v local-comfyui-folder:/data -v "$(pwd)/ComfyUI:/src" alpine sh -c "cp -r /src/* /data/"

echo "Copying Dockerfile and docker-compose.yaml into the ComfyUI folder..."
cp Dockerfile ComfyUI/
cp docker-compose.yaml ComfyUI/

echo "Building and deploying the ComfyUI Docker container..."
cd ComfyUI
docker-compose build

echo "Starting the ComfyUI Docker container in detached mode..."
docker-compose up -d

echo "ComfyUI has been installed and is accessible on http://localhost:4511"
echo "Find the model ranking here: https://imgsys.org"
echo "Find & download models here: https://civitai.com/models"
