# File structure of project

# Main folders

- Root
  - The root folder contains the main Docker files and installation script
- code
  - This contains the actual code files that will be copied to the Docker volume that is used to run the CrewAI code
- docs
  - The docs folder contains the markdown documentation for the prj
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



### Scripts

| File | Description |
| ---- | ---- |
| install.bat | The ***install.bat*** file is used to install the docker containers and copy the files to the Docker volume used by the CrewAI container |
| open_vs_code.bat | The ***open_vs_code.bat*** file is used to open a VS Code editor in the code volume folder used by the CrewAI Docker container |
| code_folder.bat | The ***code_folder.bat*** file is used to open a Windows Explorer window in the code volume folder used by the CrewAI Docker container |

## Code folder
This contains the actual code files that will be copied to the Docker volume that is used to run the CrewAI code

They are copied to the Docker volume that is used to run the CrewAI code by the installation script


This folder can be found here (if using explorer or Powrshell):

`\\wsl$\docker-desktop-data\data\docker\volumes\local-ai-folder\_data`

