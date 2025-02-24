# Visual Studio Code code generator & helper plugin test

This project creates a Docker container that runs the a number of different Code generator & helper plugins in a container outside your host machine.

The purpose is to be able to test this inj a controlled environment without having to install the plugins on your host machine.

The installed tools are:

- [Roo Code](https://github.com/RooVetGit/Roo-Code)
  - More info on how to config this plugin: [Roo Code plugin](./roo-code-plugin.md)
- [Cline](https://marketplace.visualstudio.com/items?itemName=saoudrizwan.claude-dev)
  - More info on how to config this plugin: [Cline plugin](./cline-plugin.md)
- [Continue](https://docs.continue.dev/)
  - More info on how to config this plugin: [Continue plugin](./continue-plugin.md)
- [Twinny](https://marketplace.visualstudio.com/items?itemName=rjmacarthy.twinny)
  - More info on how to config this plugin: [Twinny plugin](./twinny-plugin.md)

## Content

There are 2 different code project folders in this folder

1. A Typescript dev container in which you can try out Node.js projects
2. A Python dev container in which you can try out Python projects

### 1. Typescript dev container

Open this node-prj folder in VS Code & start the dev container

Write your code and test using the different plugins

### 2. Python dev container

Open this python-prj folder in VS Code & start the dev container

Write your code and test using the different plugins
