#!/bin/bash
# filepath: /c/code/mt/docker-local-ai/autogen-studio/install.sh

set -e

echo "Creating Docker volume 'local-autogen-folder'..."
docker volume create local-autogen-folder

# The following copy and move commands were commented out in the original script.
# Adjust and uncomment these lines if you need to copy the Python code into the Docker volume.
#
# TARGET_DIR="/mnt/wsl/docker-desktop-data/data/docker/volumes/local-autogen-folder/_data"
# echo "Copying the Autogen Python code to the Docker volume..."
# cp -r code/* "$TARGET_DIR"
# mv "$TARGET_DIR/.env.template" "$TARGET_DIR/.env"
#
# echo "Creating output directory and copying output files..."
# mkdir -p "$TARGET_DIR/output"
# cp -r code/output/* "$TARGET_DIR/output"

echo "Creating and deploying Autogen Docker container..."
docker-compose build

echo "Starting the Autogen Docker container in detached mode..."
docker-compose up -d