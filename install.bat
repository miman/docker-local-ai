echo off

REM The docker containers needs a common network to be able to communicate with each other
docker network create local-ai-network

REM Install the ollama Docker container
docker run -d --gpus all --network local-ai-network --restart always -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama

REM Install the ollama WebUI Docker container
docker run -d -p 4512:8080 --network local-ai-network --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main

REM Pull the Gemma model into Ollama
docker exec -it ollama ollama pull gemma:2b

REM Create a volume for the Used by CrewAI Docker container
docker volume create local-ai-folder

REM Copy the Python code to the CrewAI Docker volume
copy code\*.* \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data
move \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data\.env.template \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data\.env

mkdir \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data\output
copy code\output\*.* \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data\output

REM Deploy the CrewAI Docker container
docker-compose build

docker-compose up 

