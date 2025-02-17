# CrewAI

CrewAI is used to streamline workflows across industries with powerful AI agents. Build and deploy automated workflows using any LLM and cloud platform.

More information can be found here: https://www.crewai.com/

## Content

There are 2 different things in this folder

1. A VS Code test project to test the code locally using a dev-container
2. An install script to deploy a CrewAI agent as a Docker image that is run directly

The best thing to start with is to run the code project (1)

When you have some code that you want to run in a docker container you can copy it into the code folder & deploy that to Docker.

## VS Code demo project

Open this TestCrewAiPrj-folder in VS Code (or your preferred IDE), more info is in the [ReadMe](TestCrewAiPrj/README.md) in the project folder.

There is a demo project here that you can run & see how it is built, which you can use as a base to test your own use cases.

## Docker container deployment

The code in the code folder will automatically be copied to a Docker volume called **_local-ai-folder_**, observe that this will be replaced if you reinstall the project.

### Change & run code

After everyhting has been installed you can open the CrewAI code folder (Docker volume) in 2 ways:

-  Run **code_folder.bat** to open an explorer to the code folder
-  Run **open_vs_code.bat** to open an VS Code editor at the code folder

Edit the code in the main file and re-run the container by running the run.bat script.
Open a Powershell in VS Code for it to open the correct folder.

The output can be viewed in the Docker desktop by clicking on the container & Logs or by running the **docker logs local-crew-ai** command

#### Python dependencies

If you need any other python dependencies in your code add this to the **./requirements.txt** file before running **docker-compose build**.

If you already deployed everything you need to delete the container & image & run the following commands again:

```
docker-compose build

docker-compose up
```

## Webcast

A short video related to this tool can be found here:
https://youtu.be/y0zt1j-DmEQ
