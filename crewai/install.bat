echo off

REM Create a volume for the Used by CrewAI Docker container
docker volume create local-ai-folder

call scripts/set-DOCKER_FOLDER.bat

set LOCAL_FOLDER=%DOCKER_FOLDER%\local-ai-folder\_data

@REM REM Copy the Python code to the CrewAI Docker volume
echo Copying the CrewAI Python code to the Docker volume...
copy code\*.* %LOCAL_FOLDER%
move %LOCAL_FOLDER%\.env.template %LOCAL_FOLDER%\.env

mkdir %LOCAL_FOLDER%\output
copy code\output\*.* %LOCAL_FOLDER%\output

REM Start in detached mode
docker-compose down
docker-compose up -d --force-recreate --build

