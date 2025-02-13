echo off

if exist "\\wsl$\docker-desktop\mnt\docker-desktop-disk" (
   set LOCAL_FOLDER=\\wsl$\docker-desktop\mnt\docker-desktop-disk\data\docker\volumes\local-comfyui-folder\_data
) else (
   if exist "\\wsl.localhost\docker-desktop-data\data\docker\volumes" (
      set LOCAL_FOLDER=\\wsl.localhost\docker-desktop-data\data\docker\volumes\local-comfyui-folder\_data"
   )
)

set /p answer=Do you want to get the Flux1 schnell model (y/N)? 
if /i "%answer%" EQU "Y" (
  echo Downloading Flux1 schnell model...
  curl -L -o %LOCAL_FOLDER%%\models\checkpoints\flux1-schnell-fp8.safetensors https://huggingface.co/Comfy-Org/flux1-schnell/resolve/main/flux1-schnell-fp8.safetensors?download=true
)

set /p answer=Do you want to get the RealVisXL V5.0 Lightning model (y/N)? 
if /i "%answer%" EQU "Y" (
  echo Downloading RealVisXL V5.0 Lightning model...
  curl -L -o %LOCAL_FOLDER%\models\checkpoints\RealVisXL_V5.0_Lightning_fp16.safetensors https://huggingface.co/SG161222/RealVisXL_V5.0_Lightning/blob/main/RealVisXL_V5.0_Lightning_fp16.safetensors
)

set /p answer=Do you want to get the Segmind 1B model (y/N)? 
if /i "%answer%" EQU "Y" (
  echo Downloading Segmind 1B model...
  curl -L -o %LOCAL_FOLDER%\models\checkpoints\SSD-1B-A1111.safetensors https://huggingface.co/segmind/SSD-1B/resolve/main/SSD-1B-A1111.safetensors?download=true
)
