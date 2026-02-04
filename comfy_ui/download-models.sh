#!/bin/bash

# We put the models in the user's home directory
MODELS_FOLDER="~/comfyui/models"
CUSTOM_NODES_FOLDER="~/comfyui/custom_nodes"

# Create directories if they don't exist
mkdir -p "$MODELS_FOLDER/checkpoints"
mkdir -p "$MODELS_FOLDER/diffusion_models"
mkdir -p "$MODELS_FOLDER/text_encoders"
mkdir -p "$MODELS_FOLDER/vae"
mkdir -p "$CUSTOM_NODES_FOLDER"

# --- Model Downloads ---

read -p "Do you want to get the Flux1 schnell model (y/N)? " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
  FILE_PATH="$MODELS_FOLDER/checkpoints/flux1-schnell-fp8.safetensors"
  if [ ! -f "$FILE_PATH" ]; then
    echo "Downloading Flux1 schnell model..."
    curl -L -o "$FILE_PATH" "https://huggingface.co/Comfy-Org/flux1-schnell/resolve/main/flux1-schnell-fp8.safetensors?download=true"
  else
    echo "File exists, skipping download: $FILE_PATH"
  fi
fi

read -p "Do you want to get the RealVisXL V5.0 Lightning model (y/N)? " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
  FILE_PATH="$MODELS_FOLDER/checkpoints/RealVisXL_V5.0_Lightning_fp16.safetensors"
  if [ ! -f "$FILE_PATH" ]; then
    echo "Downloading RealVisXL V5.0 Lightning model..."
    curl -L -o "$FILE_PATH" "https://huggingface.co/SG161222/RealVisXL_V5.0_Lightning/blob/main/RealVisXL_V5.0_Lightning_fp16.safetensors"
  else
    echo "File exists, skipping download: $FILE_PATH"
  fi
fi

read -p "Do you want to get the Segmind 1B model (y/N)? " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
  FILE_PATH="$MODELS_FOLDER/checkpoints/SSD-1B-A1111.safetensors"
  if [ ! -f "$FILE_PATH" ]; then
    echo "Downloading Segmind 1B model..."
    curl -L -o "$FILE_PATH" "https://huggingface.co/segmind/SSD-1B/resolve/main/SSD-1B-A1111.safetensors?download=true"
  else
    echo "File exists, skipping download: $FILE_PATH"
  fi
fi

# --- DyPE Extension ---

read -p "Do you want to install the DyPE extension for Comfy UI ? (Y/N): " installDyPE
if [[ "$installDyPE" =~ ^[Yy]$ ]]; then
    DYPE_FOLDER="$CUSTOM_NODES_FOLDER/ComfyUI-DyPE"
    if [ ! -d "$DYPE_FOLDER" ]; then
      echo "Installing DyPE extension..."
      git clone https://github.com/wildminder/ComfyUI-DyPE.git "$DYPE_FOLDER"
    else
      echo "DyPE extension folder already exists, skipping git clone."
    fi

    # DyPE Models
    FILE_PATH="$MODELS_FOLDER/diffusion_models/flux1-krea-dev_fp8_scaled.safetensors"
    if [ ! -f "$FILE_PATH" ]; then
      echo "Installing DyPE flux1-krea-dev_fp8_scaled diffusion model..."
      curl -L -o "$FILE_PATH" "https://huggingface.co/Comfy-Org/FLUX.1-Krea-dev_ComfyUI/resolve/main/split_files/diffusion_models/flux1-krea-dev_fp8_scaled.safetensors"
    else
      echo "File exists, skipping download: $FILE_PATH"
    fi

    FILE_PATH="$MODELS_FOLDER/text_encoders/clip_l.safetensors"
    if [ ! -f "$FILE_PATH" ]; then
      echo "Installing DyPE text encoder clip_l..."
      curl -L -o "$FILE_PATH" "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors"
    else
      echo "File exists, skipping download: $FILE_PATH"
    fi

    FILE_PATH="$MODELS_FOLDER/text_encoders/t5xxl_fp8_e4m3fn_scaled.safetensors"
    if [ ! -f "$FILE_PATH" ]; then
      echo "Installing DyPE text encoder t5xxl_fp8_e4m3fn_scaled..."
      curl -L -o "$FILE_PATH" "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn_scaled.safetensors"
    else
      echo "File exists, skipping download: $FILE_PATH"
    fi

    FILE_PATH="$MODELS_FOLDER/vae/ae.safetensors"
    if [ ! -f "$FILE_PATH" ]; then
      echo "Installing DyPE VAE ae..."
      curl -L -o "$FILE_PATH" "https://huggingface.co/lovis93/testllm/resolve/ed9cf1af7465cebca4649157f118e331cf2a084f/ae.safetensors"
    else
      echo "File exists, skipping download: $FILE_PATH"
    fi

    echo "Now copy the workflow from '$DYPE_FOLDER/example_workflows/DyPE-Flux-workflow.json' into the ComfyUI UI"
else
    echo "DyPE extension will not be installed."
fi
