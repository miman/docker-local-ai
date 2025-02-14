echo off

REM This file will set the variable DOCKER_FOLDER to the local docker root folder

if exist "\\wsl$\docker-desktop\mnt\docker-desktop-disk" (
   set DOCKER_FOLDER=\\wsl$\docker-desktop\mnt\docker-desktop-disk\data\docker\volumes
) else (
   if exist "\\wsl.localhost\docker-desktop-data\data\docker\volumes" (
      set DOCKER_FOLDER=\\wsl.localhost\docker-desktop-data\data\docker\volumes
   )
)
