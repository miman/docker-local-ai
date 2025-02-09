echo off

REM Create a volume for the Used by Swarm Docker container
docker volume create swarm-ai-folder

REM Copy the Python code to the Swarm Docker volume
echo Copying the Swarm Python code to the Docker volume...
copy TestSwarmPrj\demo_code\*.* \\wsl$\docker-desktop-data\data\docker\volumes\swarm-ai-folder\_data
move \\wsl$\docker-desktop-data\data\docker\volumes\swarm-ai-folder\_data\.env.template \\wsl$\docker-desktop-data\data\docker\volumes\swarm-ai-folder\_data\.env

mkdir \\wsl$\docker-desktop-data\data\docker\volumes\swarm-ai-folder\_data\output
copy TestSwarmPrj\demo_code\output\*.* \\wsl$\docker-desktop-data\data\docker\volumes\swarm-ai-folder\_data\output

REM Deploy the Swarm Docker container
echo Creating and deploying Swarm Docker container...
docker-compose build

REM Start in detached mode
docker-compose up -d

