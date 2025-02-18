echo off

REM This scripts removes all created docker containers, networks & volumes

REM OBS, this file will remove all volumes as well, if you want to keep these remove the -v flags in the rows below or run the cleanup.bat script

REM Uninstall the local-crew-ai Docker container
docker-compose down -v --rmi all

REM ==============================================

REM Remove the volume used by the CrewAI Docker container
docker volume rm local-ai-folder
