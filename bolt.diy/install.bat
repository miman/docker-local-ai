echo off

REM Installing Bolt.diy into a Docker container

REM Fetch the latest version of Bolt.diy from GitHub
if exist "Bolt.diy" (
  echo Bolt.diy folder exists -> just pulling the latest changes
  cd Bolt.diy
  git pull
  cd ..
) else (
  echo Bolt.diy folder does not exist -> Cloning repo from GitHub
  git clone -b v0.0.6 https://github.com/stackblitz-labs/bolt.diy.git Bolt.diy
  copy Bolt.diy\.env.example Bolt.diy\.env.local
  call powershell -Command "(Get-Content Bolt.diy\.env.local) -replace 'OLLAMA_API_BASE_URL=.*', 'OLLAMA_API_BASE_URL=http://host.docker.internal:11434' | Set-Content Bolt.diy\.env.local"
)

REM Build the retrieved repository
cd Bolt.diy

REM Using npm script:
call npm run dockerbuild

REM Create & install the Docker image for Bolt.diy & expose on port 4511
echo Creating and deploying Bolt.diy Docker container...

call docker compose --profile development up

echo Bolt.diy has been installed and is accessible on http://localhost:4511

cd ..
