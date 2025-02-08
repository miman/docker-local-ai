# CrewAi demo project

Welcome to the CrewAi demo project, powered by [crewAI](https://crewai.com). 

This template project has a Python [devcontainer](https://code.visualstudio.com/docs/devcontainers/containers) to enable you to test writing CrewAi agents in an isolated Docker environment without you having to install python or anything on your computer.

The requirement for running devcontainers are that you have Docker running on your machine & are using an IDE compliant with devcontainers (like VS Code).

You can run the demo project without this but must then have Python... installed on your machine.

# First time

Start by installing all python dependecies by running:

```
./install_dependencies.sh
```

You only need to do this once.


# Demo project - vehicle_crew

There is a demo project in the ***vehicle_crew*** folder that you can test out before doing your own projects

This project demonstrates how a CrewAi project is setup including the use of using created tools.

The tools are very simple & hardcoded and are only there do demo how you use them and that the Crew uses them to complete the given task.

## Run the Crew

To test the pre-created crewai demo project in folder ***vehicle_crew***, run the following commands:

```
cd vehicle_crew
crewai run
```

The crew should now use the 2 tools and give an answer where the vehicle is & the driver time.

## Pre-reqs
You musty have Ollama started on your machine in a docker container, if you have it installed locally please change the URL in the ***.env*** file

## 

# Create a new Project

If you want to create a new CrewAi project, run the following command:
```
crewai create crew <project_name>
```

## Links

A good start link is the CrewAI Installation page, here you can see how to start a new project...
https://docs.crewai.com/installation

