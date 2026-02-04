#!/bin/bash

# This script now uses a Python virtual environment to run docker-compose
# to avoid conflicts with system-level packages.

VENV_DIR="compose-venv"

# Always recreate the virtual environment to ensure correct dependencies
echo "--- Ensuring a clean environment for docker-compose ---"
if [ -d "$VENV_DIR" ]; then
    echo "--- Removing old Python environment for docker-compose ---"
    rm -rf "$VENV_DIR"
fi

echo "--- Creating a dedicated Python environment for docker-compose ---"
# Ensure the python3-venv package is installed on Debian/Ubuntu systems
if ! dpkg -s python3-venv >/dev/null 2>&1; then
    echo "--- The 'python3-venv' package is required. Installing it now. ---"
    sudo apt-get update
    sudo apt-get install -y python3-venv
fi

# Create the virtual environment
python3 -m venv "$VENV_DIR"

# Install docker-compose into the environment
echo "--- Installing docker-compose into the virtual environment ---"
# We install a version of docker-compose < 1.29 because it's compatible with
# the docker python library version < 5. This avoids dependency conflicts.
if ! "$VENV_DIR/bin/python" -m pip install "docker-compose<1.29" "docker<5"; then
    echo "--- Failed to install docker-compose. Please check your Python environment and pip. ---"
    exit 1
fi

# Define the docker-compose command from the venv
DOCKER_COMPOSE_CMD="$VENV_DIR/bin/docker-compose"
echo "--- Using docker-compose from: $DOCKER_COMPOSE_CMD ---"

# Check if the ComfyUI folder exists; if so, pull the latest changes, otherwise clone it
if [ -d "ComfyUI" ]; then
  echo "ComfyUI folder exists -> pulling the latest changes..."
  cd ComfyUI
  echo "Cleaning the ComfyUI folder from untracked files..."
  git clean -fd
  git pull
  cd ..
else
  echo "ComfyUI folder does not exist -> cloning repo from GitHub..."
  git clone https://github.com/comfyanonymous/ComfyUI.git
fi

# Add the ComfyUI directory to git's safe directories
git config --global --add safe.directory /home/mikael/code/docker-local-ai-full/comfy_ui/ComfyUI

# Stop any running ComfyUI container
echo "Stopping existing ComfyUI container if it exists..."
unset DOCKER_HOST; sudo $DOCKER_COMPOSE_CMD down

# Build the Docker image with the latest code
echo "Building ComfyUI Docker image..."
unset DOCKER_HOST; sudo $DOCKER_COMPOSE_CMD build

# Start the ComfyUI container in detached mode
echo "Starting ComfyUI Docker container..."
unset DOCKER_HOST; sudo $DOCKER_COMPOSE_CMD up -d

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