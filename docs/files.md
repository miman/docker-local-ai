# File structure of project

# Main folders

- Root
  - The root folder contains the installation script & util scripts
- autogen-studio
  - Docker files and installation script for Autogen-studio
- crewai
  - Docker files and installation script for CrewAI
  - code
    - This contains the actual code files that will be copied to the Docker volume that is used to run the CrewAI code
- docs
  - The docs folder contains the markdown documentation for the prj
- flowise
  - Docker files and installation script for Flowise
- ollama
  - The installation script for Ollama
- scripts
  - This folder contains util scripts

## Root folder

### Docker installation files
The following files are used to create the docker containers, volumes and networks for Docker
* docker-compose.yaml
* Dockerfile
* .env

### Python dependencies

| File | Description |
| ---- | ---- |
| requirements.txt | The **requirements.txt** file is used to install the dependencies for the CrewAI docker container at build time |



### Scripts in the root

| File | Description |
| ---- | ---- |
| install.bat | Used to install the docker containers and copy the files to the Docker volume used by the CrewAI container |
| open_vs_code.bat | Used to open a VS Code editor in the code volume folder used by the CrewAI Docker container |
| code_folder.bat | Used to open a Windows Explorer window in the code volume folder used by the CrewAI Docker container |

### Scripts in the scripts folder

| File | Description |
| ---- | ---- |
| cleanup-all.bat | Removes all containers, volumes & networks from Docker |
| cleanup.bat | Removes only the containers from Docker |
| ollama.bat | A bat file making it easier to run commands in the shell (if placed in a folder in the path) |
| test-docker-gpu.bat | Used to test if Docker can access the GPU |

## Code folder
This contains the actual code files that will be copied to the Docker volume that is used to run the CrewAI code

They are copied to the Docker volume that is used to run the CrewAI code by the installation script


This folder can be found here (if using explorer or Powrshell):

`\\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data`

