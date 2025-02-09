# Test code to run OpenAI API calls to an Ollama instance

This project contains some code examples for how to access the Ollama using API calls using Javascript code

## Pre-reqs

You must have Ollama running on your machine (or on a Docker container on your machine (or change the URL))
If you don't run using the devcontainer you might need to change in the .env file:
API_BASE=http://host.docker.internal:11434 -> API_BASE=http://localhost:11434

Also if you don't use the devcontainer you must have NodeJS installed on your machine (https://nodejs.org/en/)

You must regardless run this to get all dependencies installed

```
npm install
```

## Demo calls

### Chat request

The code is in the **_src/chat_test.js_** file

It can be tested by running this command

```
npm run src/chat_test.js
```

### Describing the content of an Image

The code is in the **_src/image_description_test.js_** file

It can be tested by running this command (it will use the image in the resources folder)

```
npm run src/image_description_test.js
```
