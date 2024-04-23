echo off

REM This scripts removes all created docker containers, networks & volumes

REM Uninstall the local-crew-ai Docker container
docker rm -f -v local-crew-ai

REM Uninstall the ollama Docker container
docker rm -f -v ollama

REM Uninstall the ollama WebUI Docker container
docker rm -f -v open-webui

REM Remove the volume for the Used by CrewAI Docker container
docker volume rm local-ai-folder

REM The docker containers needs a common network to be able to communicate with each other
docker network rm -f local-ai-network
