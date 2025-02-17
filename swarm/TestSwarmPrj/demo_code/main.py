from swarm import Swarm, Agent
from datetime import datetime
from web_search import webSearch
from dotenv import load_dotenv

load_dotenv()

MODEL = 'granite3.1-dense:2b'

current_date = datetime.now().strftime("%Y-%m")

# Initialize Swarm client
client = Swarm()

# 2. Create AI Agents

# News Agent to fetch news
news_agent = Agent(
    name="News Assistant",
    instructions="You provide the latest news articles for a given topic using Web search.",
    functions=[webSearch],
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
    print("Running web search Agent workflow...\n")

    # Step 1: Fetch news
    news_response = client.run(
        agent=news_agent,
        messages=[
            {"role": "user", "content": f"Get me the news about {topic} on {current_date}"}],
    )

    raw_news = news_response.messages[-1]["content"]

    # Step 2: Pass news to editor for final review
    print("Running editor Agent workflow... \n\n")
    edited_news_response = client.run(
        agent=editor_agent,
        messages=[{"role": "user", "content": raw_news}],
    )

    return edited_news_response.messages[-1]["content"]


# Example of running the news workflow for a given topic
print(run_news_workflow("AI"))
