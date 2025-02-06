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
-  [Autogen-studio](https://microsoft.github.io/autogen/0.2/docs/autogen-studio/getting-started/) - AI Agent framework
-  [OpenAI Swarm](https://github.com/openai/swarm) - AI Agent framework by OpenAI (Beta)
-  [ComfyUI](https://github.com/comfyanonymous/ComfyUI.git) - Text to image AI tool
-  [N8N](https://n8n.io/)- n8n is a powerful, open-source, workflow automation tool.
-  [AnythingLLM](https://anythingllm.com/)- AnythingLLM is an open-source platform that lets you communicate with various LLMs through a unified interface.
-  [Bolt.diy](https://github.com/stackblitz-labs/bolt.diy)- Bolt.diy is an open-source platform for building Web UI's.

## Webcasts

In this YouTube playlist you can see some webcasts related to this GitHub repository:
https://www.youtube.com/playlist?list=PLoZRZ2zrcw_-Oi3Sp3IeW2zAWAMEbKKOd

## More info about the different apps

On the page linked [here](docs/ai-apps.md) you can find some more info for each of the apps that can be installed using this repository

## Pre-reqs

Docker must have been installed first

## Port reservations

Information about what ports that are used by each container can be found [here](docs/ports.md)

## Synology NAS

The scripts in the synology-nas folder can be used to install and configure the AI tools on a Synology NAS docker instance.

## VS Code AI plugins

You can run **vscode-plugins.bat** if you want to install a number of nice AI related extensions for Visual Studio Code.

## Project files

Information about the file structure of the project can be found [here](docs/files.md)
