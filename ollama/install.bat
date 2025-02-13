echo off

REM The docker containers needs a common network to be able to communicate with each other
docker network ls | findstr /r /c:"local-ai-network" >nul
IF ERRORLEVEL 1 (
    docker network create local-ai-network
) ELSE (
    echo The network local-ai-network already exists.
)

REM Start in detached mode, ensuring the latest image is used & restarting container
set /p answer=Do you want to install the Ollama UI (y/N)? 
echo Deploying Docker container...
if /i "%answer%" EQU "Y" (
docker-compose down
docker-compose pull
docker-compose up -d --force-recreate --build
) else (
  docker-compose down
  docker-compose pull ollama-container
  docker-compose up -d --force-recreate --build ollama-container
)

echo Ollama has been installed and is accessible on http://localhost:4512

echo Find and download models here: https://ollama.com/library


REM Pull the models into Ollama
set /p answer=Do you want to install granite3.1-dense:2b model into Ollama (y/N)? 
if /i "%answer%" EQU "Y" (
  echo Installing granite3.1-dense:2b as a model in Ollama...
  docker exec -it ollama ollama pull granite3.1-dense:2b
)

set /p answer=Do you want to be able to use image as input and install llava-phi3 model into Ollama (y/N)? 
if /i "%answer%" EQU "Y" (
  echo Installing llava-phi3 as a model in Ollama...
  docker exec -it ollama ollama pull llava-phi3
)

echo Remember to copy the scripts/ollama.bat file to the windows folder if you want use the ollama command as usual even though it is running in Docker
