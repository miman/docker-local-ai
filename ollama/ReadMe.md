# Ollama

Ollama is a tool for running and managing large language models locally.

This folder contains an install script to deploy **_Ollama_** & optionally **_OpenWebUI_** on Docker on your local machine.

## Ollama server

This installs the actual server that can run local models, this is also used by many of the other tools in this project.

More information about Ollama can be found here: https://ollama.com/

The list of models that can be used can be found here: https://ollama.com/library

The models downloaded to your Ollama server will be placed on a separate Docker volume called **_ollama_**, so they are kept even if you delete the container & reinstalls a newer version.

The Ollama srv docker image is configured to use you NVidia GPU for faster inference.

## Local WebUI for Ollama

Open WebUI is an extensible, self-hosted AI interface that adapts to your workflow, all while operating entirely offline.

More information can be found here: https://openwebui.com/

After installation you can run the Ollama WebUI here: [localhost:4512](http://localhost:4512)

The config for this web app will be placed on a separate Docker volume called **_open-webui_**, so they are kept even if you delete the container & reinstalls a newer version.
