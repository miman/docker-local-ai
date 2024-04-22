# docker-local-ai

Project used to create Docker containers to locally run Ollama and CrewAi.

A volume will be created where the code can be dynamically changed between each run without amny need to re-deploy the docker container.

To test that everything works, copy the files under test-files to this folder before starting the docker container

This folder can be found here:

`\\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data`

Installation instructions can be found [here](docs\local-ai-install.md)

## Overview

Deployment overview:

![overview-image](docs\images\overview.svg)

## Pre-reqs

Docker must have been installed first

## Python dependencies

If you need any other python dependnecies in your code add this to the **./requirements.txt** file before running **docker-compose build**
