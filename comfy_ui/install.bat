echo off

REM Installing ComfyUI into a Docker container
REM code origin: https://www.youtube.com/watch?v=Z914egVyXBw

REM Fetch the latest version of ComfyUI from GitHub
if exist "ComfyUI" (
  echo ComfyUI folder exists -> just pulling the latest changes
  cd ComfyUI
  git pull
  cd ..
) else (
  echo ComfyUI folder does not exist -> Cloning repo from GitHub
  git clone https://github.com/comfyanonymous/ComfyUI.git
)

REM Stop any running ComfyUI container
echo Stopping existing ComfyUI container if it exists...
docker-compose down

REM Build the Docker image with the latest code
echo Building ComfyUI Docker image...
docker-compose build

REM Start the ComfyUI container in detached mode
echo Starting ComfyUI Docker container...
docker-compose up -d

echo ComfyUI has been installed and is accessible on http://localhost:4515

REM Prompt the user if they want to download models
set /p downloadModels=Do you want to download models for ComfyUI ? (Y/N): 

IF /i "%downloadModels%" EQU "Y" (
    echo Models will be downloaded...
    REM Add your command here to download models
    call download-models.bat
) ELSE (
    echo No models will be downloaded.
)

echo Find the model ranking here:  https://imgsys.org
echo Find & download them here:  https://civitai.com/models
