@echo off

call ../scripts/set-DOCKER_FOLDER.bat

set MODELS_FOLDER=%DOCKER_FOLDER%\comfyui_models\_data
set CUSTOM_NODES_FOLDER=%DOCKER_FOLDER%\comfyui_custom_nodes\_data

REM Create directories if they don't exist
if not exist "%MODELS_FOLDER%\checkpoints" mkdir "%MODELS_FOLDER%\checkpoints"
if not exist "%MODELS_FOLDER%\diffusion_models" mkdir "%MODELS_FOLDER%\diffusion_models"
if not exist "%MODELS_FOLDER%\text_encoders" mkdir "%MODELS_FOLDER%\text_encoders"
if not exist "%MODELS_FOLDER%\vae" mkdir "%MODELS_FOLDER%\vae"

set /p answer=Do you want to get the Flux1 schnell model (y/N)? 
if /i "%answer%" EQU "Y" (
  set "FILE_PATH=%MODELS_FOLDER%\checkpoints\flux1-schnell-fp8.safetensors"
  IF NOT EXIST "%FILE_PATH%" (
    echo Downloading Flux1 schnell model...
    curl -L -o "%FILE_PATH%" https://huggingface.co/Comfy-Org/flux1-schnell/resolve/main/flux1-schnell-fp8.safetensors?download=true
  ) ELSE (
    echo %FILE_PATH% already exists, skipping download.
  )
)

set /p answer=Do you want to get the RealVisXL V5.0 Lightning model (y/N)? 
if /i "%answer%" EQU "Y" (
  set "FILE_PATH=%MODELS_FOLDER%\checkpoints\RealVisXL_V5.0_Lightning_fp16.safetensors"
  IF NOT EXIST "%FILE_PATH%" (
    echo Downloading RealVisXL V5.0 Lightning model...
    curl -L -o "%FILE_PATH%" https://huggingface.co/SG161222/RealVisXL_V5.0_Lightning/blob/main/RealVisXL_V5.0_Lightning_fp16.safetensors
  ) ELSE (
    echo %FILE_PATH% already exists, skipping download.
  )
)

set /p answer=Do you want to get the Segmind 1B model (y/N)? 
if /i "%answer%" EQU "Y" (
  set "FILE_PATH=%MODELS_FOLDER%\checkpoints\SSD-1B-A1111.safetensors"
  IF NOT EXIST "%FILE_PATH%" (
    echo Downloading Segmind 1B model...
    curl -L -o "%FILE_PATH%" https://huggingface.co/segmind/SSD-1B/resolve/main/SSD-1B-A1111.safetensors?download=true
  ) ELSE (
    echo %FILE_PATH% already exists, skipping download.
  )
)

REM Install DyPE (https://github.com/wildminder/ComfyUI-DyPE)
set /p installDyPE=Do you want to install the DyPE extension for Comfy UI ? (Y/N):
IF /i "%installDyPE%" EQU "Y" (
    set "DYPE_FOLDER=%CUSTOM_NODES_FOLDER%\ComfyUI-DyPE"
    IF NOT EXIST "%DYPE_FOLDER%\" (
      echo Installing DyPE extension...
      git clone https://github.com/wildminder/ComfyUI-DyPE.git "%DYPE_FOLDER%"
    ) ELSE (
      echo DyPE extension folder already exists, skipping git clone.
    )

    set "FILE_PATH=%MODELS_FOLDER%\diffusion_models\flux1-krea-dev_fp8_scaled.safetensors"
    IF NOT EXIST "%FILE_PATH%" (
      echo Installing DyPE flux1-krea-dev_fp8_scaled diffusion model...
      curl -L -o "%FILE_PATH%" https://huggingface.co/Comfy-Org/FLUX.1-Krea-dev_ComfyUI/resolve/main/split_files/diffusion_models/flux1-krea-dev_fp8_scaled.safetensors
    ) ELSE (
      echo %FILE_PATH% already exists, skipping download.
    )

    set "FILE_PATH=%MODELS_FOLDER%\text_encoders\clip_l.safetensors"
    IF NOT EXIST "%FILE_PATH%" (
      echo Installing DyPE text encoder clip_l...
      curl -L -o "%FILE_PATH%" https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors
    ) ELSE (
      echo %FILE_PATH% already exists, skipping download.
    )

    set "FILE_PATH=%MODELS_FOLDER%\text_encoders\t5xxl_fp8_e4m3fn_scaled.safetensors"
    IF NOT EXIST "%FILE_PATH%" (
      echo Installing DyPE text encoder t5xxl_fp8_e4m3fn_scaled...
      curl -L -o "%FILE_PATH%" https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn_scaled.safetensors
    ) ELSE (
      echo %FILE_PATH% already exists, skipping download.
    )

    set "FILE_PATH=%MODELS_FOLDER%\vae\ae.safetensors"
    IF NOT EXIST "%FILE_PATH%" (
      echo Installing DyPE VAE ae...
      curl -L -o "%FILE_PATH%" https://huggingface.co/lovis93/testllm/resolve/ed9cf1af7465cebca4649157f118e331cf2a084f/ae.safetensors
    ) ELSE (
      echo %FILE_PATH% already exists, skipping download.
    )

    echo Now copy .\ComfyUI-DyPE\example_workflows\DyPE-Flux-workflow.json the Workflow into the ComfyUI UI
) ELSE (
    echo DyPE extension will not be installed.
)