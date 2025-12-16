echo off

REM Installing ACE-step into a Docker container

REM Fetch the latest version of ACE-step from GitHub
if exist "ACE-step" (
  echo ACE-step folder exists -> just pulling the latest changes
  cd ACE-step
  git pull
  cd ..
) else (
  echo ACE-step folder does not exist -> Cloning repo from GtiHub
  git clone https://github.com/ace-step/ACE-Step.git
)

REM Create & install the Docker image for ACE-step & expose on port 7865
echo Creating and deploying ACE-step Docker container...

cd ACE-step

docker-compose build
docker-compose up --force-recreate

@REM docker-compose up -d

echo ACE-step has been installed and is accessible on http://localhost:7865

cd ..
