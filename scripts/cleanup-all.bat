echo off

REM This scripts removes all created docker containers, networks & volumes

REM OBS, this file will remove all volumes as well, if you want to keep these remove the -v flags in the rows below or run the cleanup.bat script

REM Uninstall the local-crew-ai Docker container
docker rm -f -v local-crew-ai
docker rmi local-crew-ai:latest

REM Uninstall the ollama Docker container
docker rm -f -v ollama
docker rmi ollama/ollama:latest

REM Uninstall the ollama WebUI Docker container
docker rm -f -v open-webui

REM Remove the volume for the Used by CrewAI Docker container
docker volume rm local-ai-folder
docker rmi ghcr.io/open-webui/open-webui:main

REM Uninstall the Flowise Docker container
docker rm -f flowise
docker rmi flowise:latest

REM The docker containers needs a common network to be able to communicate with each other
docker network rm -f local-ai-network
