echo off

REM Installing Flowise into a Docker container

REM Fetch the latest version of Flowise from GitHub
git clone https://github.com/FlowiseAI/Flowise.git

REM Build the retrieved repository
cd Flowise

npx --yes pnpm install

REM Create & install the Docker image for Flowise & expose on port 4511
docker build --no-cache -t flowise .

docker run -d --name flowise -p 4511:3000 flowise

echo Flowise has been installed and is accessible on http://localhost:4511

cd ..
