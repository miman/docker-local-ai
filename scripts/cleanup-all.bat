echo off

REM This scripts removes all created docker containers, networks & volumes

REM OBS, this file will remove all volumes as well, if you want to keep these remove the -v flags in the rows below or run the cleanup.bat script

echo off

REM This scripts removes all created docker containers & images but NOT the networks & volumes

REM OBS, this file will remove all volumes as well, if you want to keep these remove the -v flags in the rows below

REM Uninstall the local-crew-ai Docker container
cd ..\crewai
docker-compose down -v --rmi all
cd ..\scripts

REM Uninstall the ollama Docker container
cd ..\ollama
docker-compose down -v --rmi all
cd ..\scripts

REM Uninstall the Flowise Docker container
docker rm -f flowise
docker rmi flowise:latest

REM Uninstall the anythingllm Docker container
docker rm -f anythingllm
docker rmi mintplexlabs/anythingllm

REM Uninstall the autogen-studio Docker container
cd ..\autogen-studio
docker-compose down -v --rmi all
cd ..\scripts

REM Uninstall the bolt.diy Docker container
cd ..\bolt.diy\Bolt.diy
docker-compose down -v --rmi all
cd ..\..\scripts

REM Uninstall the ComfyUI Docker container
cd ..\comfy_ui\ComfyUI
docker-compose down -v --rmi all
cd ..\..\scripts

REM Uninstall the n8n Docker container
cd ..\n8n
docker-compose down -v --rmi all
cd ..\scripts

REM Uninstall the swarm Docker container
cd ..\swarm
docker-compose down -v --rmi all
cd ..\scripts

REM ==============================================

REM Remove the volume for the Used by CrewAI Docker container
docker volume rm local-ai-folder
docker rmi ghcr.io/open-webui/open-webui:main

REM The docker containers needs a common network to be able to communicate with each other
docker network rm -f local-ai-network
