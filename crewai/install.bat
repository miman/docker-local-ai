echo off

REM Create a volume for the Used by CrewAI Docker container
docker volume create local-ai-folder

REM Copy the Python code to the CrewAI Docker volume
echo Copying the CrewAI Python code to the Docker volume...
copy code\*.* \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data
move \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data\.env.template \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data\.env

mkdir \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data\output
copy code\output\*.* \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data\output

REM Start in detached mode
docker-compose down
docker-compose pull
docker-compose up -d --force-recreate --build

