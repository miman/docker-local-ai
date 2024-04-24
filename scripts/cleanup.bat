echo off

REM This scripts removes all created docker containers but NOT the networks & volumes

REM OBS, this file will remove all volumes as well, if you want to keep these remove the -v flags in the rows below

REM Uninstall the local-crew-ai Docker container
docker rm -f local-crew-ai
docker rmi local-crew-ai:latest

REM Uninstall the ollama Docker container
docker rm -f ollama
docker rmi ollama/ollama:latest

REM Uninstall the ollama WebUI Docker container
docker rm -f open-webui
docker rmi ghcr.io/open-webui/open-webui:main

REM Uninstall the Flowise Docker container
docker rm -f flowise
docker rmi flowise:latest
