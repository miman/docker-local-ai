echo off

REM This scripts removes all created docker containers, networks & volumes

REM Uninstall the crawl4ai Docker container
docker rm -f crawl4ai

