echo off

REM This scripts removes all created docker containers, networks & volumes

REM OBS, this file will remove all volumes as well, if you want to keep these remove the -v flags in the rows below or run the cleanup.bat script

REM Uninstall the local-crew-ai Docker container
cd ..\crewai
call cleanup-all.bat
cd ..\scripts

REM Uninstall the ollama Docker container
cd ..\ollama
call cleanup-all.bat
cd ..\scripts

REM Uninstall the Flowise Docker container
cd ..\flowise
call cleanup-all.bat
cd ..\scripts

REM Uninstall the anythingllm Docker container
cd ..\AnythingLLM
call cleanup-all.bat
cd ..\scripts

REM Uninstall the autogen-studio Docker container
cd ..\autogen-studio
call cleanup-all.bat
cd ..\scripts

REM Uninstall the bolt.diy Docker container
cd ..\bolt.diy\Bolt.diy
call cleanup-all.bat
cd ..\..\scripts

REM Uninstall the ComfyUI Docker container
cd ..\comfy_ui\ComfyUI
call cleanup-all.bat
cd ..\..\scripts

REM Uninstall the n8n Docker container
cd ..\n8n
call cleanup-all.bat
cd ..\scripts

REM Uninstall the swarm Docker container
cd ..\swarm
call cleanup-all.bat
cd ..\scripts

REM ==============================================

REM The docker containers needs a common network to be able to communicate with each other
docker network rm -f local-ai-network
