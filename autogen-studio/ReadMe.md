# Autogen-studio

AutoGen Studio is an low-code interface built to help you rapidly prototype AI agents, enhance them with skills, compose them into workflows and interact with them to accomplish tasks.
It is built on top of the AutoGen framework, which is a toolkit for building AI agents.

More information can be found here: https://microsoft.github.io/autogen/0.2/docs/autogen-studio/getting-started/

After installation you can run the Autogen-studio Web UI here: [localhost:4514](http://localhost:4514)

## Use Ollama as LLM server

To use Ollama as LLM server for a team, please follow these steps:

1. Open the **Gallery** in Autogen-studio
2. Click the **Edit** button
3. Search for "Mistral" & change the Mistral models/provider
4. go to the model_client block in the JSON file
5. Change the value of the **base_url** field to point to your Ollama server (e.g. http://host.docker.internal:11434/v1)
6. change the value in config/model to the model you want to use (ex: granite3.1-dense:2b)
7. Optionally change the label to something you want to have
8. Add this block on the row over the base_url: "api_key": "NO_KEY_NEEDED",
   1. This is needed because Autogen-studio for some reason requires one, but Ollama isn't using any.
9. Save the changes (disk button)

Now you have a model that gows to your Ollama server

To try this out you can do the following

1. Click on "Team Builder"
2. Select the "Default Team"
3. Open the Models block
4. Drag the model you changed (Should have your model name on it) to the "Drop your model here) on the AssistantAgent
5. Save the changes
6. Run your agent by clicking the "Test Team" button
7. Optionally use a math prompt to se that is uses the calculator tool (ex: "what is 22 times 10")

## Webcast

A short video related to this tool can be found here:
https://youtu.be/OAzf7-me8RA
