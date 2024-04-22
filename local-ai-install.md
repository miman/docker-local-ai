# Prepare Docker

## Steps

These are the steps needed:

* Create common network
* Deploy Ollama container
* Pull gemma:2b model
* Create Docker volume for CrewAI
* Copy file to this folder from test-files
* rename the copied file .env.template to .env
* Deploy CrewAI Docker container

## Create common network

Run the following command to create the common network the containers will use:

```docker network create my-host-network```

# Install Ollama in docker container

run in shell:

```docker run -d --gpus=all --network my-host-network -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama```

## Try by installing & running the small gemma:2b model

Run in shell:

```ollama run gemma:2b```


# Create a shortcut bat file.

Do this to avoid writing 
* **docker exec -it ollama ollama run llama2** 

& instead write 

* **ollama run llama2**

The file should contain this content:

```
echo off

docker exec -it ollama ollama %1 %2 %3
```

# Install Crewai docker container

## Create Docker volume
docker volume create ai-client-code

## Create Dockerfile
Create a **Dockerfile** with the following content:

```
# syntax=docker/dockerfile:1

# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/

ARG PYTHON_VERSION=3.11.9
FROM python:${PYTHON_VERSION}-slim as base

# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1

# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.cache/pip to speed up subsequent builds.
# Leverage a bind mount to requirements.txt to avoid having to copy them into
# into this layer.
RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    python -m pip install -r requirements.txt

# Copy the source code into the container.
COPY . .

# Run the application.
CMD python main.py
```

## Create docker-compose.yml file
Create a **docker-compose.yml** with the following content:

```
services:
  file-test:
    image: volume-test # Your image name
    container_name: vl
    networks:
      - my-host-network
    volumes:
      - ai-client-code:/app # Mount the current directory as /app volume (optional for development)
    build:
      context: .

volumes:
  ai-client-code:
    external: true

networks:
  my-host-network:
    external: true # Optional: Creates the network if it doesn't exist
```

## Deployment

To deploy the docker container run the following commands
* docker-compose build
* docker-compose up

# Network

## Create docker network

docker network create my-host-network

