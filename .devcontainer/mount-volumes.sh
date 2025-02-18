#!/bin/bash

# This file Mounts folder from host machine to the container

# Mount .npmrc
if [ -f "$HOME/.npmrc" ]; then
  echo "Mounting .npmrc"
  mount -o bind "$HOME/.npmrc" "/.npmrc" # Or use docker run -v if you prefer
fi

# Mount .gitconfig
if [ -f "$HOME/.gitconfig" ]; then
  echo "Mounting .gitconfig"
  sudo mount -o bind "$HOME/.gitconfig" "/root/.gitconfig" # Or use docker run -v
fi

# Mount .ssh
if [ -d "$HOME/.ssh" ]; then  # Use -d for directories
  echo "Mounting .ssh"
  sudo mount -o bind "$HOME/.ssh" "/root/.ssh" # Or use docker run -v
fi

# Mount Docker socket (use with caution)
if [ -S "/var/run/docker.sock" ]; then # Use -S for sockets
  echo "Mounting docker.sock"
  sudo mount -o bind "/var/run/docker.sock" "/var/run/docker.sock" # Or use docker run -v
fi

