echo off

REM Create a volume for the Used by CrewAI Docker container
docker volume create local-autogen-folder

REM Copy the Python code to the CrewAI Docker volume
@REM echo Copying the Autogen Python code to the Docker volume...
@REM copy code\*.* \\wsl$\docker-desktop-data\data\docker\volumes\local-autogen-folder\_data
@REM move \\wsl$\docker-desktop-data\data\docker\volumes\local-autogen-folder\_data\.env.template \\wsl$\docker-desktop-data\data\docker\volumes\local-autogen-folder\_data\.env

@REM mkdir \\wsl$\docker-desktop-data\data\docker\volumes\local-autogen-folder\_data\output
@REM copy code\output\*.* \\wsl$\docker-desktop-data\data\docker\volumes\local-autogen-folder\_data\output

REM Deploy the Autogen Docker container
echo Creating and deploying Autogen Docker container...
docker-compose build

REM Start in detached mode
docker-compose up -d

