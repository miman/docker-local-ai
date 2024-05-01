echo off

REM The docker containers needs a common network to be able to communicate with each other
docker network create local-ai-network

REM Install the Ollama Docker container
set /p answer=Do you want to install Ollama (y/N)? 

if /i "%answer%" EQU "Y" (
  echo Installing Ollama as a Docker container...
  cd ollama
  CALL install.bat
  cd ..
) else (
  echo Not installing Ollama
)

set /p answer=Do you want to install Autogen (y/N)? 

if /i "%answer%" EQU "Y" (
  echo Installing Autogen as a Docker container...
  cd autogen-studio
  CALL install.bat
  cd ..
) else (
  echo Not installing Autogen
)

set /p answer=Do you want to install CrewAI (y/N)? 

if /i "%answer%" EQU "Y" (
  echo Installing CrewAI as a Docker container...
  cd crewai
  CALL install.bat
  cd ..
) else (
  echo Not installing CrewAI
)

set /p answer=Do you want to install Flowise (y/N)? 

if /i "%answer%" EQU "Y" (
  echo Installing Flowise as a Docker container...
  cd flowise
  CALL install.bat
  cd ..
) else (
  echo Not installing Flowise
)
