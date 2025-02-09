# File structure of project

# Main folders

-  Root
   -  The root folder contains the installation script & util scripts
-  AnythingLLM
   -  Docker files and installation script for AnythingLLM
-  autogen-studio
   -  Docker files and installation script for Autogen-studio
-  bolt.diy
   -  Docker files and installation script for bolt.diy
-  bolt.diy
   -  Docker files and installation script for comfy_ui
-  crewai
   -  Docker files and installation script for CrewAI
   -  code
      -  This contains the actual code files that will be copied to the Docker volume that is used to run the CrewAI code
-  docs
   -  The docs folder contains the markdown documentation for the prj
-  flowise
   -  Docker files and installation script for Flowise
-  n8n
   -  Docker files and installation script for n8n
-  ollama
   -  The installation script for Ollama
-  scripts
   -  This folder contains util scripts
-  swarm
   -  Docker files and installation script for swarm
-  synology-nas
   -  Docker project files for containers to be run in a synology NAS

## Root folder

### Scripts in the root

| File               | Description                                                                                                |
| ------------------ | ---------------------------------------------------------------------------------------------------------- |
| install.bat        | Used to install the docker containers and copy the files to the Docker volume used by the CrewAI container |
| open_vs_code.bat   | Used to open a VS Code editor in the code volume folder used by the CrewAI Docker container                |
| code_folder.bat    | Used to open a Windows Explorer window in the code volume folder used by the CrewAI Docker container       |
| vscode-plugins.bat | Used to install some good AI related plugins in Visual Studio Code                                         |

### Scripts in the scripts folder

| File                | Description                                                                                  |
| ------------------- | -------------------------------------------------------------------------------------------- |
| cleanup-all.bat     | Removes all containers, volumes & networks from Docker                                       |
| cleanup.bat         | Removes only the containers from Docker                                                      |
| ollama.bat          | A bat file making it easier to run commands in the shell (if placed in a folder in the path) |
| test-docker-gpu.bat | Used to test if Docker can access the GPU                                                    |
