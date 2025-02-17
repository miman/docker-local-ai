#!/bin/bash
# filepath: /c/code/mt/docker-local-ai/bolt.diy/install.sh

set -e

BOLT_VER="v0.0.6"
echo "Installing Bolt.diy '$BOLT_VER' into a Docker container..."

# Check if the Bolt.diy directory exists. If so, pull the latest changes; if not, clone the repo.
if [ -d "Bolt.diy" ]; then
  echo "Bolt.diy folder exists -> just pulling the latest changes"
  cd Bolt.diy
  git pull origin $BOLT_VER
  cd ..
else
  echo "Bolt.diy folder does not exist -> Cloning repo from GitHub"
  git clone -b $BOLT_VER https://github.com/stackblitz-labs/bolt.diy.git Bolt.diy
  cp Bolt.diy/.env.example Bolt.diy/.env.local

  # Replace OLLAMA_API_BASE_URL value using sed.
  sed -i.bak 's/^OLLAMA_API_BASE_URL=.*/OLLAMA_API_BASE_URL=http:\/\/host.docker.internal:11434/' Bolt.diy/.env.local
  rm Bolt.diy/.env.local.bak
fi

# Build the retrieved repository
cd Bolt.diy
echo "Building Bolt.diy with npm..."
npm run dockerbuild

# Create & install the Docker image for Bolt.diy & expose on port 5173
echo "Creating and deploying Bolt.diy Docker container..."

docker-compose down
docker-compose pull
docker-compose --profile development up -d --force-recreate --build

echo "Bolt.diy has been installed and is accessible on http://localhost:5173"

cd ..