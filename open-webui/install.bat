echo off

REM The docker containers needs a common network to be able to communicate with each other
docker network ls | findstr /r /c:"local-ai-network" >nul
IF ERRORLEVEL 1 (
    docker network create local-ai-network
) ELSE (
    echo The network local-ai-network already exists.
)

REM Start in detached mode, ensuring the latest image is used & restarting container
echo Deploying Docker container...
docker-compose down
docker-compose pull
docker-compose up -d --force-recreate --build

echo Open-webui has been installed and is accessible on http://localhost:4512
