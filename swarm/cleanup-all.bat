echo off

REM This scripts removes the created docker containers, networks & volumes

REM OBS, this file will remove all volumes as well, if you want to keep these remove the -v flags in the rows below

REM Uninstall the swarm Docker container
docker-compose down -v --rmi all

REM ==============================================

REM Remove the volume used by teh Swarm Docker container
docker volume rm swarm-ai-folder
