echo off

REM this is a script enabling a windows user to write "ollama run llama2" instead of "docker exec -it ollama ollama run llama2"

docker exec -it ollama ollama %1 %2 %3
