# Twinny plugin

[Twinny](https://marketplace.visualstudio.com/items?itemName=rjmacarthy.twinny) is a developer plugin to VS Code that helps you write code faster by providing code completions, code generation, and code search.

## Configuration

### Config connectors

To configure the Twinny plugin to use the local Ollama server, you need to set the following in the Twinny connectors:

- Model Name: qwen2.5-coder
- Hostname: host.docker.internal
- Port: 11434
- Protocol: http

Change the model to any you have installed on your Ollama server.

The config is found by:

1. Click on the Twinny tool
2. Click on the connector icon (like an electric plug) in the top menu
