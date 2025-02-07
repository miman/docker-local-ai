echo off

set CURRENT_PATH=%CD%
REM Open VS Code in the code folder, obs run powershell not cmd otherwise the folder will default to Windows in VS code
if exist "\\wsl$\docker-desktop\mnt\docker-desktop-disk" (
   code "\\wsl$\docker-desktop\mnt\docker-desktop-disk\data\docker\volumes\local-ai-folder\_data"
) else (
   if exist "\\wsl.localhost\docker-desktop-data\data\docker\volumes" (
      code "\\wsl.localhost\docker-desktop-data\data\docker\volumes\local-ai-folder\_data"
   )
)
