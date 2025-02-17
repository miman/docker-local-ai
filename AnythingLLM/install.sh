#!/bin/bash
# filepath: /c/code/mt/docker-local-ai/AnythingLLM/install.sh

# Define the storage location.
STORAGE_LOCATION="/mnt/c/Development/docker-storage/anythingllm"

# Create the storage directory if it doesn't exist.
if [ ! -d "$STORAGE_LOCATION" ]; then
  mkdir -p "$STORAGE_LOCATION"
fi

# Create the .env file with DISABLE_TELEMETRY if it doesn't exist.
if [ ! -f "$STORAGE_LOCATION/.env" ]; then
  echo "DISABLE_TELEMETRY='true'" >> "$STORAGE_LOCATION/.env"
fi

echo "Removing the old AnythingLLM container..."
docker rm -f anythingllm || true

echo "Fetching the latest version of the AnythingLLM image..."
docker pull mintplexlabs/anythingllm

echo "Installing the AnythingLLM Docker container..."
docker run -d --gpus all \
  --network local-ai-network \
  -p 4513:3001 \
  --cap-add SYS_ADMIN \
  -v "$STORAGE_LOCATION:/app/server/storage" \
  -v "$STORAGE_LOCATION/.env:/app/server/.env" \
  -e STORAGE_DIR="/app/server/storage" \
  --name anythingllm \
  mintplexlabs/anythingllm