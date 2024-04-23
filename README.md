# docker-local-ai

Project used to create Docker containers to locally run Ollama and CrewAi.

A volume will be created where the code can be dynamically changed between each run without any need to re-deploy the docker container.

## Overview

This is an overview of what will be deployed:

![overview-image](docs/images/overview.svg)

## Workflow

### Installation

Installs 3 docker containers and code volume by running the **install.bat** script

These are the docker containers that are installed

* Ollama - local AI model engine
* Ollama WebUI - Web UI for local Ollama instance
* CrewAI Python environment

### Local WebUI for Ollama

You can run the Ollama WebUI here: [localhost:4512](http://localhost:4512)


### Change & run code
After everyhting has been installed you can open the code folder (Docker volume) in 2 ways:
* Run **scripts/code_folder.bat** to open an explorer to the code folder
* Run **scripts/open_vs_code.bat** to open an VS Code editor at the code folder

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

## Manual Installation

Manual installation instructions can be found [here](docs/local-ai-install.md)
