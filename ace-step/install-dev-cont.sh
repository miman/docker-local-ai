#!/bin/bash
# filepath: /c/code/mt/docker-local-ai/ACE-step/install.sh

set -e

echo "Installing ACE-step into a Docker container..."

# Fetch the latest version of ACE-step from GitHub
if [ -d "ACE-step" ]; then
  echo "ACE-step folder exists -> just pulling the latest changes"
  cd ACE-step
  git pull
  cd ..
else
  echo "ACE-step folder does not exist -> Cloning repo from GitHub"
  git clone https://github.com/ace-step/ACE-Step.git
fi

echo "Creating and deploying ACE-step Docker container..."
cd ACE-step
pip install -r requirements.txt
