from duckduckgo_search import DDGS
from parse_web_page import getWebpageText
import json

def webSearch(topic, withPagePayload=True):
    print(f"Running DuckDuckGo web search for {topic}...")
    
    # DuckDuckGo search
    ddg_api = DDGS()
    results = ddg_api.text(f"{topic}", max_results=1)
    if results:
        url = results[0]['href']
        # Create one json object for each result item with members title, url, description & body
        json_objects = createWebSearchResults(results, withPagePayload)
        
        search_results = json.dumps(json_objects, indent=4)
        print(f"search_results: \n>>>\n{search_results}\n<<<\n")
        return search_results
    else:
        return f"Could not find web search results for {topic}."

def createWebSearchResults(results, withPagePayload=True):
    # Create a list of results
    json_objects = []

    url = results[0]['href']
    for result in results:
        title = result['title']
        url = url
        description = result['body']
        if (withPagePayload):
          body = getWebpageText(url)
        else:
          body = ""
        
        json_object = {
            "title": title,
            "url": url,
            "description": description,
            "body": body
        }
        json_objects.append(json_object)
    return json_objects