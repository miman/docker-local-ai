echo off

call ../scripts/set-DOCKER_FOLDER.bat

set LOCAL_FOLDER=%DOCKER_FOLDER%\swarm-ai-folder\_data

echo: LOCAL_FOLDER: %LOCAL_FOLDER%
REM Open the code folder in Windows Explorer
explorer %LOCAL_FOLDER%
