#!/bin/bash
# This script adds an alias "ollama" that executes "docker exec -it ollama ollama" with all parameters.
# It will add the alias to your ~/.bashrc file on Linux,
# or to ~/.bash_profile (or ~/.zshrc if using zsh) on macOS by default.

ALIAS_LINE="alias ollama='docker exec -it ollama ollama \"\$@\"'"

# Function to add the alias if not already present
add_alias() {
  local config_file="$1"
  if [ ! -f "$config_file" ]; then
    # Create the config file if it does not exist.
    touch "$config_file"
  fi

  if grep -Fq "$ALIAS_LINE" "$config_file"; then
    echo "Alias already exists in $config_file"
  else
    echo "$ALIAS_LINE" >> "$config_file"
    echo "Alias added to $config_file"
    echo "You may need to run 'source $config_file' or restart your shell to use the new alias."
  fi
}

OS_TYPE=$(uname)
if [ "$OS_TYPE" = "Darwin" ]; then
  # macOS
  # Check if the user is using zsh (default on recent macOS) or bash.
  if [ -n "$ZSH_VERSION" ]; then
    CONFIG_FILE="$HOME/.zshrc"
  else
    CONFIG_FILE="$HOME/.bash_profile"
  fi
else
  # Assume Linux
  CONFIG_FILE="$HOME/.bashrc"
fi

add_alias "$CONFIG_FILE"