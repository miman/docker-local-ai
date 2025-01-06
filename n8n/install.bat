echo off

REM The docker containers needs a common network to be able to communicate with each other
docker network create local-ai-network

REM Create a volume for the Used by Swarm Docker container
docker volume create n8n_data

REM Installing N8N into a Docker container
echo Creating Docker container...
docker-compose build

REM Start in detached mode
echo Deploying Docker container...
docker-compose up -d

