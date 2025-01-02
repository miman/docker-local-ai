# Ollama on Synology NAS

The docker compose files in the sub-directories are for:

-  installing and running the Ollama server on a Synology NAS.
-  installing and running the Ollama open-webui client on a Synology NAS.

OBS ! Remember that there is no GPU in the NAS so you need to run very small models to get any usable results

# Pre-reqs

You MUST create a network called **local-ai-network** in the container manager on the NAS before creating the projects installing the Ollama server & client.

# Installation

1. Create the network as described above
2. Create the ollama fodlers on your NAS for the volumes used in the containers
   1. docker/ollama
   2. docker/ollama/ollama/
   3. docker/ollama/open_webui
   4. docker/ollama/open_webui/data
3. Create the project for the Ollama server and install it using the docker-compose file in the ollama directory
4. Create the project for the Ollama open-webui client and install it using the docker-compose file in the ollama_open_webui directory
5. Change the URL for the ollama server in open-webui from **localhost** to **host.docker.internal**
6. Activate ssh on the NAS
7. open a ssh connection to the nas & add the models you want to have, like:
   1. sudo docker exec -it ollama ollama pull llama3.2:1b
   2. sudo docker exec -it ollama ollama pull qwen2.5:0.5b
