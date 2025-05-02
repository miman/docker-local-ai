# Google ADK test app

This folder contains some Google ADK (Agent Developer Kit) projects for testing purposes.

Some of the projects are run ni the web mode and the mcp_agent project is run using the run.sh file in that folder.

## Agents running in web client

These agents can be run from the web client 
### Run the example

run this in the shell

```
adk web
```

Then select the **weather_agent** tool in the drop-down and enter the query in the text box.

### weather_agent

This app will just return the weather (hardcoded) using a ADK tool

Test query:

```
what is the weather in new york
```

### mcp_agent

This app will just return the weather (hardcoded) OR use a MCP tool to work with files using a ADK tool

Test query:

```
list the files in /workspaces/docker-local-ai/google-adk
```


## self_sustained_mcp_agent

This app will use an MCP server to list all files in this folder.
Just to exemplify how to use MCP with ADK

## run the example

In the self_sustained_mcp_agent folder run:

```
./run.sh
```
