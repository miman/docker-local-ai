echo off

REM Create a volume for the Used by CrewAI Docker container
docker volume create local-ai-folder

REM Copy the Python code to the CrewAI Docker volume
copy code\*.* \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data
move \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data\.env.template \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data\.env

mkdir \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data\output
copy code\output\*.* \\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data\output

REM Deploy the CrewAI Docker container
docker-compose build

docker-compose up 

