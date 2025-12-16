echo off

call ./scripts/set-DOCKER_FOLDER.bat

REM Open the DOCKER VOLUMES folder in Windows Explorer
echo Docker folder: %DOCKER_FOLDER%
explorer %DOCKER_FOLDER%
