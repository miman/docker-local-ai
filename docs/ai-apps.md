# AI Applications

This page describes a little about all AI applications that can be deployed using this project

## Ollama

Ollama is a tool for running and managing large language models locally.

More information can be found here: https://ollama.com/

The list of models that can be used can be found here: https://ollama.com/library

## Local WebUI for Ollama

Open WebUI is an extensible, self-hosted AI interface that adapts to your workflow, all while operating entirely offline.

More information can be found here: https://openwebui.com/

After installation you can run the Ollama WebUI here: [localhost:4512](http://localhost:4512)

## Flowise

Flowise is an open source low-code tool for developers to build customized LLM orchestration flow & AI agents

More information can be found here: https://flowiseai.com/

After installation you can run the Flowise Web UI here: [localhost:4511](http://localhost:4511)

## CrewAI

CrewAI is used to streamline workflows across industries with powerful AI agents. Build and deploy automated workflows using any LLM and cloud platform.

More information can be found here: https://www.crewai.com/

### Change & run code

After everyhting has been installed you can open the CrewAI code folder (Docker volume) in 2 ways:

-  Run **scripts/code_folder.bat** to open an explorer to the code folder
-  Run **scripts/open_vs_code.bat** to open an VS Code editor at the code folder

Edit the code in the main file and re-run the container by running the run.bat script.

The output can be viewed in the Docker desktop by clicking on the container & Logs or by running the **docker logs local-crew-ai** command

#### Python dependencies

If you need any other python dependencies in your code add this to the **./requirements.txt** file before running **docker-compose build**.

If you already deployed everything you need to delete the container & image & run the wollowing commands again:

```
docker-compose build

docker-compose up
```

## ComfyUI

ComfyUI is an powerful and modular diffusion model GUI and backend, used to generate images from text prompts.

More information can be found here: https://github.com/comfyanonymous/ComfyUI

After installation you can run the ComfyUI Web UI here: [localhost:4515](http://localhost:4515)

## Bolt.diy

Bolt.diy is an open source tool for developers to Prompt, run, edit, and deploy full-stack web apps.

More information can be found here: https://github.com/stackblitz-labs/bolt.diy

After installation you can run the Bolt.diy Web UI here: [localhost:5173](http://localhost:5173)

## Autogen-studio

AutoGen Studio is an low-code interface built to help you rapidly prototype AI agents, enhance them with skills, compose them into workflows and interact with them to accomplish tasks.
It is built on top of the AutoGen framework, which is a toolkit for building AI agents.

More information can be found here: https://microsoft.github.io/autogen/0.2/docs/autogen-studio/getting-started/

After installation you can run the Autogen-studio Web UI here: [localhost:4514](http://localhost:4514)

## OpenAI Swarm

OpenAI Swarm is an educational framework exploring ergonomic, lightweight multi-agent orchestration built by OpenAI (Obs, this is a Beta framework not to be used for production).

More information can be found here: https://github.com/openai/swarm

## AnythingLLM

AnythingLLM is an open-source platform that lets you communicate with various LLMs through a unified interface.

More information can be found here: https://anythingllm.com/

After installation you can run the AnythingLLM Web UI here: [localhost:4513](http://localhost:4513)

## N8N

N8N is a workflow automation platform whre you visually can create AI solutions and automate tasks.

More information can be found here: https://n8n.io/

After installation you can run the N8N Web UI here: [localhost:5678](http://localhost:5678)
