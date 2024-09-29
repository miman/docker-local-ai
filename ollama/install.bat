echo off

REM The docker containers needs a common network to be able to communicate with each other
docker network create local-ai-network

REM Install the ollama Docker container
docker run -d --gpus all --network local-ai-network --restart always -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama

REM Install the ollama WebUI Docker container
set /p answer=Do you want to install Ollama UI (y/N)? 

if /i "%answer%" EQU "Y" (
  echo Installing Ollama UI as a Docker container...
  docker run -d -p 4512:8080 --network local-ai-network --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
)

REM Pull the llama3.2 model into Ollama
set /p answer=Do you want to install llama3.2 3b model into Ollama (y/N)? 

if /i "%answer%" EQU "Y" (
  echo Installing llama3.2 3b as a model in Ollama...
  docker exec -it ollama ollama pull llama3.2
)
