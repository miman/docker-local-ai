echo off

REM This scripts removes all created docker containers but NOT the networks & volumes

REM OBS, this file will remove all volumes as well, if you want to keep these remove the -v flags in the rows below

REM Uninstall the local-crew-ai Docker container
docker rm -f local-crew-ai

REM Uninstall the ollama Docker container
docker rm -f ollama

REM Uninstall the ollama WebUI Docker container
docker rm -f open-webui
