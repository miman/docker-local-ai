#!/bin/bash
# filepath: /c:/code/mt/docker-local-ai/crewai/install.sh

# Create a volume for the CrewAI Docker container
docker volume create local-ai-folder

echo "Copying the CrewAI Python code to the Docker volume..."

# Set the target directory for the Docker volume.
# Adjust this path if your Docker volume data is mounted elsewhere.
TARGET_DIR="/mnt/wsl/docker-desktop-data/data/docker/volumes/local-ai-folder/_data"

# Copy all code files to the Docker volume's data directory
cp -r code/* "$TARGET_DIR"

# Rename the .env.template file to .env
mv "$TARGET_DIR/.env.template" "$TARGET_DIR/.env"

# Create an output directory and copy its contents
mkdir -p "$TARGET_DIR/output"
cp -r code/output/* "$TARGET_DIR/output"

echo "Starting Docker containers in detached mode..."
docker-compose down
docker-compose up -d --force-recreate --build