from duckduckgo_search import DDGS
from swarm import Swarm, Agent
from datetime import datetime
import requests
from dotenv import load_dotenv, set_key

dotenv_path = '.env'

load_dotenv()

# OPENAI_BASE_URL=http://localhost:11434/v1
MODEL = 'granite3.1-dense:2b'

current_date = datetime.now().strftime("%Y-%m")

# Initialize Swarm client
client = Swarm()

# 1. Create Internet Search Tool


def get_news_articles(topic):
    print(f"Running DuckDuckGo news search for {topic}...")

    # DuckDuckGo search
    ddg_api = DDGS()
    results = ddg_api.text(f"{topic} {current_date}", max_results=1)
    if results:
        url = results[0]['href']
        news_results = "\n\n".join(
            [f"Title: {result['title']}\nURL: {url}\nDescription: {result['body']} \nWebpage body: {getWebpagePayload(url)}" for result in results])
        print(f"news_results: {news_results}...")
        return news_results
    else:
        return f"Could not find news results for {topic}."


def getWebpagePayload(url):
    response = requests.get(url)
    response.encoding = 'utf-8'  # Ensure UTF-8 encoding

    if response.status_code == 200:
        data = response.text
        return data
    else:
        print(f"Failed to retrieve data: {response.status_code}")
        return ""

# 2. Create AI Agents


# News Agent to fetch news
news_agent = Agent(
    name="News Assistant",
    instructions="You provide the latest news articles for a given topic using Web search.",
    functions=[get_news_articles],
    model=MODEL
)

# Editor Agent to edit news
editor_agent = Agent(
    name="Editor Assistant",
    instructions="Rewrite and give me as news article ready for publishing. Each News story in separate section.",
    model=MODEL
)

# 3. Create workflow


def run_news_workflow(topic):
    print("Running news Agent workflow...")

    # Step 1: Fetch news
    news_response = client.run(
        agent=news_agent,
        messages=[
            {"role": "user", "content": f"Get me the news about {topic} on {current_date}"}],
    )

    raw_news = news_response.messages[-1]["content"]

    # Step 2: Pass news to editor for final review
    edited_news_response = client.run(
        agent=editor_agent,
        messages=[{"role": "user", "content": raw_news}],
    )

    return edited_news_response.messages[-1]["content"]


# Example of running the news workflow for a given topic
print(run_news_workflow("AI"))
