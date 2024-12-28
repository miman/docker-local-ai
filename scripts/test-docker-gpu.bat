echo off

REM This scripts runs a container using gpu access to see if CUDA support has been installed correctly

docker run --rm --gpus all nvidia/cuda:12.6.3-base-ubuntu22.04 nvidia-smi
