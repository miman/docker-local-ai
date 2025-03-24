echo off

REM Installing https://github.com/langchain-ai/local-deep-researcher into a Docker container

REM Fetch the latest version of Flowise from GitHub
if exist "local-deep-researcher" (
  echo local-deep-researcher folder exists -> just pulling the latest changes
  cd local-deep-researcher
  git pull
) else (
  echo local-deep-researcher folder does not exist -> Cloning repo from GitHub
  git clone https://github.com/langchain-ai/local-deep-researcher.git
  cd local-deep-researcher
)

docker build -t ollama-deep-researcher .

docker run --rm -it -p 2024:2024 -e OLLAMA_BASE_URL="http://192.168.68.130:11434/" -e OLLAMA_MODEL="gemma3:latest" ollama-deep-researcher

@REM SEARCH_API=xxx # the search API to use, such as `duckduckgo` (default)
@REM TAVILY_API_KEY=xxx # the tavily API key to use
@REM PERPLEXITY_API_KEY=xxx # the perplexity API key to use
@REM MAX_WEB_RESEARCH_LOOPS=xxx # the maximum number of research loop steps, defaults to `3`
@REM FETCH_FULL_PAGE=xxx # fetch the full page content (with `duckduckgo`), defaults to `false`

cd ..

echo Web UI can be found here: https://smith.langchain.com/studio/thread?baseUrl=http://127.0.0.1:2024
