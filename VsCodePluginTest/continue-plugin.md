# Continue plugin

[Continue](https://docs.continue.dev/) is a developer plugin to VS Code that helps you write code faster by providing code completions, code generation, and code search.

## Configuration

To configure the continue plugin to use the local Ollama server, you need to set the following in the continue config file:

```
  "models": [
    {
      "model": "qwen2.5-coder",
      "provider": "ollama",
      "apiKey": "",
      "apiBase": "http://host.docker.internal:11434",
      "title": "Qwen 2.5 Coder"
    }
  ],
  "tabAutocompleteModel": {
    "title": "Qwen 2.5 Coder",
    "provider": "ollama",
    "model": "qwen2.5-coder",
    "apiBase": "http://host.docker.internal:11434",
    "apiKey": ""
  },
```

Change the model to any you have installed on your Ollama server.

The config file is found by:

1. clicking on the continue tool
2. clicking on the cogwheel in the top right corner
3. Click on the "Open configuration file" button
