echo off

REM This scripts removes all created docker containers, networks & volumes

REM OBS, this file will remove all volumes as well, if you want to keep these remove the -v flags in the rows below or run the cleanup.bat script

REM Uninstall the anythingllm Docker container
cd ..\AnythingLLM
docker-compose down -v --rmi all
cd ..\scripts

REM ==============================================

REM Remove the volume used by the anythingllm Docker containers
docker volume rm anythingllm
