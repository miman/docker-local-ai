#!/bin/bash
# filepath: /c:/code/mt/docker-local-ai/install.sh

# Create a common network for the docker containers to communicate
docker network create local-ai-network

# Function to prompt for installation
prompt_install() {
  local name="$1"
  local dir="$2"
  local script="$3"  # Script to execute in the directory (e.g. ./install.sh)

  read -p "Do you want to install ${name} (y/N)? " answer
  if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "Installing ${name} as a Docker container..."
    if cd "$dir"; then
      $script
      cd ..
    else
      echo "Failed to enter directory: ${dir}"
    fi
  else
    echo "Not installing ${name}"
  fi
}

prompt_install "Ollama" "ollama" "./install.sh"
prompt_install "CrewAI" "crewai" "./install.sh"
prompt_install "Swarm" "swarm" "./install.sh"
prompt_install "AnythingLLM" "AnythingLLM" "./install.sh"
prompt_install "Autogen studio" "autogen-studio" "./install.sh"
prompt_install "Flowise" "flowise" "./install.sh"
prompt_install "n8n" "n8n" "./install.sh"
prompt_install "Bolt.diy" "bolt.diy" "./install.sh"
prompt_install "comfy-ui" "comfy_ui" "./install.sh"