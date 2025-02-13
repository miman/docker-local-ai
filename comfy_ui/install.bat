echo off

REM Installing ComfyUI into a Docker container
REM code origin: https://www.youtube.com/watch?v=Z914egVyXBw

REM Create a volume for the Used by CrewAI Docker container
docker volume create local-comfyui-folder

REM Fetch the latest version of Flowise from GitHub
if exist "ComfyUI" (
  echo ComfyUI folder exists -> just pulling the latest changes
  cd ComfyUI
  git pull
  cd ..
) else (
  echo ComfyUI folder does not exist -> Cloning repo from GitHub
  git clone https://github.com/comfyanonymous/ComfyUI.git
)

REM Copy the files to the ComfyUI Docker volume
echo Copying the ComfyUI files to the Docker volume...
xcopy ComfyUI \\wsl$\docker-desktop-data\data\docker\volumes\local-comfyui-folder\_data /E /H /I /Y

REM Copy the Dockerfiles to the ComfyUI folder
COPY Dockerfile .\ComfyUI\
COPY docker-compose.yaml .\ComfyUI\

REM Deploy the ComfyUI Docker container
echo Creating ComfyUI Docker container...
CD ComfyUI
docker-compose build

REM Start in detached mode
echo Deploying ComfyUI Docker container...
docker-compose up -d

echo ComfyUI has been installed and is accessible on http://localhost:4511

CD ..

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
