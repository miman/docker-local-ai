# Google ADK test app

This folder contains some Google ADK (Agent Developer Kit) projects for testing purposes.

Some of the projects are run ni the web mode and the mcp_agent project is run using the run.sh file in that folder.

## weather_agent

This app will just return the weather (hardcoded) using a ADK tool

Test query:

```
what is the weather in new york
```

### Run the example

run

```
adk web
```

Then select the **weather_agent** tool in the drop-down and enter the query in the text box.

## mcp_agent

This app will use an MCP server to list all files in this folder.
Just to exemplify how to use MCP with ADK

## run the example

In the mcp_agent folder run:

```
./run.sh
```
