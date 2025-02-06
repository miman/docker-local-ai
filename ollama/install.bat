echo off

REM The docker containers needs a common network to be able to communicate with each other
docker network ls | findstr /r /c:"local-ai-network" >nul
IF ERRORLEVEL 1 (
    docker network create local-ai-network
) ELSE (
    echo The network local-ai-network already exists.
)

REM Stop & remove any old Ollama container so a new one can be installed
echo Removing the old Ollama container...
docker rm -f ollama

REM Ensure the latest version of ollama image is fetched
echo Fetching the latest version of the Ollama image...
docker pull ollama/ollama

REM Install the ollama Docker container
echo Creating a new Ollama container...
docker run -d --gpus all --network local-ai-network --restart always -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama

REM Install the ollama WebUI Docker container
set /p answer=Do you want to install Ollama UI (y/N)? 

if /i "%answer%" EQU "Y" (
  echo "Removing the old Ollama UI container..."
  docker rm -f open-webui

  echo Ensure the latest version of ollama image is fetched
  echo "Fetching the latest version of the Ollama UI image..."
  docker pull ghcr.io/open-webui/open-webui:main

  echo "Installing Ollama UI Docker container..."

  echo Installing Ollama UI as a Docker container...
  docker run -d -p 4512:8080 --network local-ai-network --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
)

REM Pull the llama3.2 model into Ollama
set /p answer=Do you want to install llama3.2 3b model into Ollama (y/N)? 

if /i "%answer%" EQU "Y" (
  echo Installing qwen2.5:3b as a model in Ollama...
  docker exec -it ollama ollama pull qwen2.5:3b
)
