#!/bin/bash
# filepath: /c/code/mt/docker-local-ai/swarm/install.sh

set -e

echo "Creating Docker volume 'swarm-ai-folder'..."
docker volume create swarm-ai-folder

# Define the target directory for the Docker volume data.
TARGET_DIR="/mnt/wsl/docker-desktop-data/data/docker/volumes/swarm-ai-folder/_data"

echo "Copying the Swarm Python code to the Docker volume..."
# Copy everything from TestSwarmPrj/demo_code into the target directory
cp -r TestSwarmPrj/demo_code/* "$TARGET_DIR"

echo "Renaming .env.template to .env..."
mv "$TARGET_DIR/.env.template" "$TARGET_DIR/.env"

echo "Creating output directory and copying output files..."
mkdir -p "$TARGET_DIR/output"
cp -r TestSwarmPrj/demo_code/output/* "$TARGET_DIR/output"

echo "Building the Swarm Docker container..."
docker-compose build

echo "Starting the Swarm Docker container in detached mode..."
docker-compose up -d