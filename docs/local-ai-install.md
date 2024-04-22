# Prepare Docker

## Steps

These are the steps needed:

- Create common network
- Deploy Ollama container
- Pull gemma:2b model
- Create Docker volume for CrewAI
- Copy file to this folder from test-files
- rename the copied file .env.template to .env
- Deploy CrewAI Docker container

## Create common network

Run the following command to create the common network the containers will use:

`docker network create local-ai-network`

# Install Ollama in docker container

run in shell:

`docker run -d --gpus=all --network local-ai-network -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama`

## Try by installing & running the small gemma:2b model

Run in shell:

If you did the optional step in the end of this file:

`ollama run gemma:2b`

otherwise:

`docker exec -it ollama ollama run gemma:2b`

# Install Crewai docker container

## Create Docker volume

`docker volume create local-ai-folder`

## Deployment

To deploy the docker container run the following commands

- docker-compose build
- docker-compose up

# Optionally - Create a shortcut bat file.

Do this to avoid writing

- **docker exec -it ollama ollama run llama2**

& instead write

- **ollama run llama2**

You should copy the file **./scripts/ollama.bat** to a folder in your path
