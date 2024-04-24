echo off

REM The docker containers needs a common network to be able to communicate with each other
docker network create local-ai-network

REM Install the ollama Docker container
docker run -d --gpus all --network local-ai-network --restart always -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama

REM Install the ollama WebUI Docker container
set /p answer=Do you want to install CrewAI UI (y/N)? 

if /i "%answer%" EQU "Y" (
  echo Installing CrewAI UI as a Docker container...
  docker run -d -p 4512:8080 --network local-ai-network --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
)

REM Pull the Gemma model into Ollama
set /p answer=Do you want to install CrewAI UI (y/N)? 

if /i "%answer%" EQU "Y" (
  echo Installing Gemma:2b as a model in CrewAI...
  docker exec -it ollama ollama pull gemma:2b
)
