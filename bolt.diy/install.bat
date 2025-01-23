echo off

REM Installing Bolt.diy into a Docker container

REM Fetch the latest version of Bolt.diy from GitHub
curl -L https://github.com/stackblitz-labs/bolt.diy/archive/refs/tags/v0.0.6.zip -o v0.0.6.zip

if exist "Bolt.diy" (
  echo Bolt.diy folder exists -> just pulling the latest changes
  cd Bolt.diy
  git pull
  cd ..
) else (
  echo Bolt.diy folder does not exist -> Cloning repo from GtiHub
  git clone -b v0.0.6 https://github.com/stackblitz-labs/bolt.diy.git Bolt.diy
)

REM Build the retrieved repository
cd Bolt.diy

REM Using npm script:
call npm run dockerbuild

REM OR using direct Docker command:
@REM docker build . --target bolt-ai-development

@REM REM Create & install the Docker image for Bolt.diy & expose on port 4511
echo Creating and deploying Bolt.diy Docker container...

call docker compose --profile development up

echo Bolt.diy has been installed and is accessible on http://localhost:4511

cd ..
