# docker-local-ai

Project used to create Docker containers to locally run Ollama and CrewAi.

A volume will be created where the code can be dynamically changed between each run without amny need to re-deploy the docker container.

To test that everything works, copy the files under test-files to this folder before starting the docker container

This folder can be found here:

`\\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data`


## Overview

This is an overview of what will be deployed:

![overview-image](docs/images/overview.svg)

## Workflow

### Installation

Install both docker containers and code volume by running the **install.bat** script

### Change & run code
After everyhting has been installed you can open the code folder (Docker volume) in 2 ways:
* Run **scripts/code_folder.bat** to open an explorer to the code folder
* Run **scripts/open_vs_code.bat** to open an VS Code editor at the code folder

Edit the code in the main file and re-run the container by running the run.bat script.

The output can be viewed in the Docker desktop by clicking on the container & Logs or by running the **docker logs local-crew-ai** command

#### Python dependencies

If you need any other python dependencies in your code add this to the **./requirements.txt** file before running **docker-compose build**.

If you already deployed everything you need to delete the container & image & run build & start again

## Pre-reqs

Docker must have been installed first

## Manual Installation

Manual installation instructions can be found [here](docs/local-ai-install.md)
