#!/bin/bash
# filepath: /c/code/mt/docker-local-ai/flowise/install.sh

set -e

echo "Installing Flowise into a Docker container..."

# Fetch the latest version of Flowise from GitHub
if [ -d "Flowise" ]; then
  echo "Flowise folder exists -> just pulling the latest changes"
  cd Flowise
  git pull
  cd ..
else
  echo "Flowise folder does not exist -> Cloning repo from GitHub"
  git clone https://github.com/FlowiseAI/Flowise.git
fi

# Build the retrieved repository.
# Assuming you have converted build_flowise.bat to build_flowise.sh
if [ -x "build_flowise.sh" ]; then
  echo "Building Flowise..."
  ./build_flowise.sh
else
  echo "build_flowise.sh not found or not executable. Please create it or adjust this script."
  exit 1
fi

echo "Creating and deploying Flowise Docker container..."
cd Flowise

docker build --no-cache -t flowise .

docker run -d --network local-ai-network --name flowise -p 4511:3000 flowise

echo "Flowise has been installed and is accessible on http://localhost:4511"

cd ..