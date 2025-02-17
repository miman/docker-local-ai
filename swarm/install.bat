echo off

REM Create a volume for the Used by Swarm Docker container
docker volume create swarm-ai-folder

call ../scripts/set-DOCKER_FOLDER.bat

set LOCAL_FOLDER=%DOCKER_FOLDER%\swarm-ai-folder\_data

REM Copy the Python code to the Swarm Docker volume
echo Copying the Swarm Python code to the Docker volume...
copy TestSwarmPrj\demo_code\*.* %LOCAL_FOLDER%
move %LOCAL_FOLDER%\.env.template %LOCAL_FOLDER%\.env

mkdir %LOCAL_FOLDER%\output
copy TestSwarmPrj\demo_code\output\*.* %LOCAL_FOLDER%\output

REM Deploy the Swarm Docker container
echo Creating and deploying Swarm Docker container...
docker-compose build

REM Start in detached mode
docker-compose up -d

