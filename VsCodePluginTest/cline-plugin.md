# Cline plugin

[Cline](https://marketplace.visualstudio.com/items?itemName=saoudrizwan.claude-dev) is a developer plugin to VS Code that helps you write code faster by providing code completions, code generation, and code search.

## Configuration

### Config connectors

To configure the Cline plugin to use the local Ollama server, you need to set the following in the Cline connectors:

- Select **Ollama** in the API Provider
- Model ID: qwen2.5-coder
- Base URL: http://host.docker.internal:11434

Change the model to any you have installed on your Ollama server, it will automatically display a list of options that are installed on the Ollama server, you just click on the one you want to use.

The config is found by:

1. Click on the Cline tool
2. The config is automatically displayed the first time
