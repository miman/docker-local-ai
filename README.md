# docker-local-ai

Project used to create Docker containers to locally run Ollama, CrewAi, Autogen-studio & Flowise.

A volume will be created where the code can be dynamically changed between each run without any need to re-deploy the docker container.

## Overview

This is an overview of what will be deployed:

![overview-image](docs/images/overview.svg)

## Installation

You have the option to install a number of AI related docker containers and code volume by running the **install.bat** script

You will get a question for each tool if you want to install it or not.

If you just want to install one tool without all questions just go into the relevant folder & run install.
A lot of the tools depend on Ollama being installed first though (if you want to run the LLM locally)

These are the docker containers that can be installed

-  [Ollama](https://ollama.com/) - Local AI model engine
-  [Ollama WebUI](https://github.com/open-webui/open-webui) - Web UI for local Ollama instance
-  [CrewAI](https://www.crewai.com/) - AI Agent framework
-  [Flowise](https://flowiseai.com/)- Visual LLM UI
-  [Autogen-studio](https://autogen-studio.com/) - AI Agent framework
-  [OpenAI Swarm](https://github.com/openai/swarm) - AI Agent framework by OpenAI (Beta)
-  [ComfyUI](https://github.com/comfyanonymous/ComfyUI.git) - Text to image AI tool
-  [N8N](https://flowiseai.com/)- n8n is a powerful, open-source, workflow automation tool.
-  [AnythingLLM](https://flowiseai.com/)- AnythingLLM is an open-source platform that lets you communicate with various LLMs through a unified interface.
-  [Bolt.diy](https://flowiseai.com/)- Bolt.diy is an open-source platform for building Web UI's.

## Local WebUI for Ollama

You can run the Ollama WebUI here: [localhost:4512](http://localhost:4512)

## Flowise Web UI

You can run the Flowise Web UI here: [localhost:4511](http://localhost:4511)

## CrewAI

### Change & run code

After everyhting has been installed you can open the CrewAI code folder (Docker volume) in 2 ways:

-  Run **scripts/code_folder.bat** to open an explorer to the code folder
-  Run **scripts/open_vs_code.bat** to open an VS Code editor at the code folder

Edit the code in the main file and re-run the container by running the run.bat script.

The output can be viewed in the Docker desktop by clicking on the container & Logs or by running the **docker logs local-crew-ai** command

#### Python dependencies

If you need any other python dependencies in your code add this to the **./requirements.txt** file before running **docker-compose build**.

If you already deployed everything you need to delete the container & image & run the wollowing commands again:

```
docker-compose build

docker-compose up
```

## Pre-reqs

Docker must have been installed first

## Project files

Information about the file structure of the project can be found [here](docs/files.md)

## Port reservations

Information about what ports that are used by each containercan be found [here](ports.md)

## Manual Installation

Manual installation instructions can be found [here](docs/local-ai-install.md)

## Synology NAS

The scripts in the synology-nas folder can be used to install and configure the AI tools on a Synology NAS docker instance.
