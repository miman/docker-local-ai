echo off

REM The docker containers needs a common network to be able to communicate with each other
docker network ls | findstr /r /c:"local-ai-network" >nul
IF ERRORLEVEL 1 (
    docker network create local-ai-network
) ELSE (
    echo The network local-ai-network already exists.
)

REM Create a volume for the Used by Swarm Docker container
docker volume ls | findstr /r /c:"n8n_data" >nul
IF ERRORLEVEL 1 (
    docker volume create n8n_data
) ELSE (
    echo The volume n8n_data already exists.
)

REM Start in detached mode
echo Deploying Docker container...
docker-compose down
docker-compose pull
docker-compose up -d --force-recreate --build

REM Remove dangling images
echo Removing dangling Docker images...
docker image prune -f
