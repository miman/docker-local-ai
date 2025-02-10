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

This will run a question to the LLM and return the answer.

The code is in the **_src/chat_test.ts_** file

It can be tested by running this command

```
npm run test_chat
```

### Chat request with tools

This will run 2 different questions to the LLM, which will return with an answer on which tool to use, this tool will then be run & the response for the question will be returned.

The code is in the **_src/chat_with_tools.ts_** file

It can be tested by running this command

```
npm run chat_tools
```

### Describing the content of an Image

This will ask the LLM to describe the content of a JPEG image using a LLava model.

It will then write the response from the LLM model.

The code is in the **_src/image_description_test.ts_** file

It can be tested by running this command (it will use the image in the resources folder)

```
npm run describe_image
```
