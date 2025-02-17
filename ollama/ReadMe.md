# Ollama

Ollama is a tool for running and managing large language models locally.

This folder contains an install script to deploy **_Ollama_** & optionally **_OpenWebUI_** on Docker on your local machine.

## Ollama server

This installs the actual server that can run local models, this is also used by many of the other tools in this project.

More information about Ollama can be found here: https://ollama.com/

The list of models that can be used can be found here: https://ollama.com/library

The models downloaded to your Ollama server will be placed on a separate Docker volume called **_ollama_**, so they are kept even if you delete the container & reinstalls a newer version.

The Ollama srv docker image is configured to use you NVidia GPU for faster inference.

### For Mac users

While Mac doesn't support that Docker uses the GPU, running Ollama as a docker container on a Mac is very slow so I propose to install ollama-desktop for Mac.

Can be found here: https://ollama.com/download/mac

## Local WebUI for Ollama

Open WebUI is an extensible, self-hosted AI interface that adapts to your workflow, all while operating entirely offline.

More information can be found here: https://openwebui.com/

After installation you can run the Ollama WebUI here: [localhost:4512](http://localhost:4512)

OBS !

You need to change the Ollama connection URL to this if you run Ollama in docker:

`http://host.docker.internal:11434`

You find this setting by:

1. Click on your user icon
2. Select "Admin panel"
3. Click on Settings menu item
4. Select Connections

The config for this web app will be placed on a separate Docker volume called **_open-webui_**, so they are kept even if you delete the container & reinstalls a newer version.

## Ollama API access code

There is a demo project with some example code in Javascript that accesses the Ollama instance

More info can be found [here](demo_code/ReadMe.md)

A short video related to this tool can be found here:
https://youtu.be/GF2nXT4LcSU
