echo off

REM This scripts removes all created docker containers, networks & volumes

REM OBS, this file will remove all volumes as well, if you want to keep these remove the -v flags in the rows below or run the cleanup.bat script

REM Uninstall the n8n Docker container
cd ..\n8n
docker-compose down -v --rmi all
cd ..\scripts

REM ==============================================

REM Remove the volume used by the N8N Docker container
docker volume rm n8n_data
