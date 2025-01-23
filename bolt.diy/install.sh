echo off

# Installing Bolt.diy into a Docker container

# Fetch the latest version of Bolt.diy from GitHub
curl -L https://github.com/stackblitz-labs/bolt.diy/archive/refs/tags/v0.0.6.zip -o v0.0.6.zip

if [ -d "CodeRepo" ]; then
  echo CodeRepo folder exists -> just pulling the latest changes
  cd CodeRepo
  git pull
  cd ..
else
  echo CodeRepo folder does not exist -> Cloning repo from GtiHub
  git clone -b v0.0.6 https://github.com/stackblitz-labs/bolt.diy.git CodeRepo
fi

# Build the retrieved repository
cd CodeRepo

# Using npm script:
npm run dockerbuild

# OR using direct Docker command:
docker build . --target bolt-ai-development

@# # Create & install the Docker image for Bolt.diy & expose on port 5173
echo Creating and deploying Bolt.diy Docker container...

docker compose --profile development up

echo Bolt.diy has been installed and is accessible on http://localhost:5173

cd ..
