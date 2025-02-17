echo off

call ../scripts/set-DOCKER_FOLDER.bat

set LOCAL_FOLDER=%DOCKER_FOLDER%\swarm-ai-folder\_data

REM Open VS Code in the code folder, obs run powershell not cmd otherwise the folder will default to Windows in VS code
code "%LOCAL_FOLDER%"
