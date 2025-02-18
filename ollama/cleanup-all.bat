echo off

REM This scripts removes all created docker containers, networks & volumes

REM OBS, this file will remove all volumes as well, if you want to keep these remove the -v flags in the rows below or run the cleanup.bat script

REM Uninstall the ollama Docker container
docker-compose down -v --rmi all

REM ==============================================

REM Remove the volume used by the Ollama Docker containers
docker volume rm ollama
docker volume rm open-webui
