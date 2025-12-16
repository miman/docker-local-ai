echo off

REM This scripts removes all created docker containers, networks & volumes

REM OBS, this file will remove all volumes as well, if you want to keep these remove the -v flags in the rows below or run the cleanup.bat script

REM Uninstall the ACE-step Docker container
docker rm -f ACE-step
docker rmi ace-step-ace-step:latest

rm -rf ACE-Step