echo off

REM Installing Flowise into a Docker container

REM Fetch the latest version of Flowise from GitHub
if exist "Flowise" (
  echo Flowise folder exists -> just pulling the latest changes
  cd Flowise
  git pull
  cd ..
) else (
  echo Flowise folder does not exist -> Cloning repo from GtiHub
  git clone https://github.com/FlowiseAI/Flowise.git
)

REM Build the retrieved repository
CALL build_flowise.bat

REM Create & install the Docker image for Flowise & expose on port 4511
echo Creating and deploying Flowise Docker container...

cd Flowise

docker build --no-cache -t flowise .

docker run -d --network local-ai-network --name flowise -p 4511:3000 flowise

echo Flowise has been installed and is accessible on http://localhost:4511

cd ..
