# OpenAI Swarm demo project

Welcome to the OpenAI Swarm demo project. 

This template project has a Python [devcontainer](https://code.visualstudio.com/docs/devcontainers/containers) to enable you to test writing OpenAI Swarm agents in an isolated Docker environment without you having to install python or anything on your computer.

The requirement for running devcontainers are that you have Docker running on your machine & are using an IDE compliant with devcontainers (like VS Code).

You can run the demo project without this but must then have Python... installed on your machine.

# First time

Start by installing all python dependecies by running:

```
./install_dependencies.sh
```

You only need to do this once.

# Demo project - demo_code

There is a demo project in the ***demo_code*** folder that you can test out before doing your own projects

This project demonstrates how a CrewAi project is setup including the use of using created tools.

The tools are very simple & hardcoded and are only there do demo how you use them and that the Crew uses them to complete the given task.

## Run the Crew

To test the pre-created crewai demo project in folder ***demo_code***, run the following commands:

```
cd demo_code
python main.py
```

The agent should now use the web search tool and give an answer about the latest news articles for AI agents.

## Pre-reqs
You musty have Ollama started on your machine in a docker container, if you have it installed locally please change the URL in the ***.env*** file
