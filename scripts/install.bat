echo off

REM The docker containers needs a common network to be able to communicate with each other
docker network create local-ai-network

REM Install the ollama Docker container
docker run -d --gpus=all --network local-ai-network -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama

REM Pull the Gemma model into Ollama
docker exec -it ollama ollama pull gemma:2b

REM Create a volume for the Used by CrewAI Docker container
docker volume create local-ai-folder

REM Copy the Python code to the CrewAI Docker volume
copy test-files\*.* \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data

REM Deploy the CrewAI Docker container
docker-compose build

docker-compose up

