#!/bin/bash

# Start in detached mode, Use your favorite revision number
docker pull unclecode/crawl4ai:latest
docker run -d -p 11235:11235 --name crawl4ai --shm-size=1g unclecode/crawl4ai:latest

echo Visit the Crawl4AI playground at http://localhost:11235/playground
