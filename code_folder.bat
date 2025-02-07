echo off

REM Open the code folder in Windows Explorer
if exist "\\wsl$\docker-desktop\mnt\docker-desktop-disk" (
   explorer "\\wsl$\docker-desktop\mnt\docker-desktop-disk\data\docker\volumes\local-ai-folder\_data"
) else (
   if exist "\\wsl.localhost\docker-desktop-data\data\docker\volumes" (
      explorer "\\wsl.localhost\docker-desktop-data\data\docker\volumes\local-ai-folder\_data"
   )
)

