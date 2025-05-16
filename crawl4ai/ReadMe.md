# Crawl4AI
This folder contains some Crawl4AI projects for testing purposes.

# Setup

There are 2 steps to the installation:

* First install Crawl4AI into Docker
* Install all needed dependencies for running the examples.

### Install Crawl4AI into Docker
```
./install.bat
or
./install.sh
```

### Install dependencies for Crawl4AI
To install the python dependencies you must run the following commands

The first for installing the dependencies and the second for installing the browser dependencies.
```
pip install -r requirements.txt
python -m playwright install --with-deps chromium
```

## Run examples

There are 2 examples, one simple test that just crawls a website and another more complex example that uses an LLM to extract information from the crawled content.

### Simple Test

To run this example you must have installed the dependencies as described above. Then you can run the following commands:
```
cd simple-test
python app.py
```

### LLM Test

This example will fetch the main stocks information from CNN and use an LLM to extract the values from the Today's hot stocks section of the page.

To run this example you must have installed the dependencies as described above. Then you can run the following commands:
```
cd crawl-llm
python stocks.py
```
