echo off

SET STORAGE_LOCATION="C:\Development\docker-storage\anythingllm"

if not exist "%STORAGE_LOCATION%" mkdir "%STORAGE_LOCATION%"
if not exist "%STORAGE_LOCATION%\.env" echo DISABLE_TELEMETRY='true' >> "%STORAGE_LOCATION%\.env"

echo "Removing the old AnythingLLM container..."
docker rm -f anythingllm

echo "Fetching the latest version of the AnythingLLM image..."
docker pull mintplexlabs/anythingllm

echo "Install the AnythingLLM Docker container..."
docker run -d --gpus all --network local-ai-network -p 4513:3001 --cap-add SYS_ADMIN -v "%STORAGE_LOCATION%:/app/server/storage" -v "%STORAGE_LOCATION%\.env:/app/server/.env" -e STORAGE_DIR="/app/server/storage" --name anythingllm mintplexlabs/anythingllm
