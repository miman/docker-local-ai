echo off

REM This scripts removes all created docker containers & images but NOT the networks & volumes

REM Uninstall the local-crew-ai Docker container
cd ..\crewai
docker-compose down --rmi all
cd ..\scripts

REM Uninstall the ollama Docker container
cd ..\ollama
docker-compose down --rmi all
cd ..\scripts

REM Uninstall the Flowise Docker container
docker rm -f flowise
docker rmi flowise:latest

REM Uninstall the anythingllm Docker container
docker rm -f anythingllm
docker rmi mintplexlabs/anythingllm

REM Uninstall the autogen-studio Docker container
cd ..\autogen-studio
docker-compose down --rmi all
cd ..\scripts

REM Uninstall the bolt.diy Docker container
cd ..\bolt.diy\Bolt.diy
docker-compose down --rmi all
cd ..\..\scripts

REM Uninstall the ComfyUI Docker container
cd ..\comfy_ui\ComfyUI
docker-compose down --rmi all
cd ..\..\scripts

REM Uninstall the n8n Docker container
cd ..\n8n
docker-compose down --rmi all
cd ..\scripts

REM Uninstall the swarm Docker container
cd ..\swarm
docker-compose down --rmi all
cd ..\scripts
