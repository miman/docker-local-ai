echo off

REM This scripts removes all created docker containers, networks & volumes

REM OBS, this file will remove all volumes as well, if you want to keep these remove the -v flags in the rows below or run the cleanup.bat script

REM Uninstall the autogen-studio Docker container
cd ..\autogen-studio
docker-compose down -v --rmi all
cd ..\scripts

REM ==============================================

REM The docker containers needs a common network to be able to communicate with each other
docker volume rm local-autogen-folder
