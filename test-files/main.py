import os

from dotenv import load_dotenv
from langchain_community.llms.ollama import Ollama

from crewai import Agent, Crew, Process, Task

load_dotenv()

ollama_model = Ollama(model="gemma:2b", base_url="http://host.docker.internal:11434")


# Define your agents with roles and goals
researcher = Agent(
   role='Researcher',
   goal='Discover new insights',
   backstory="You're a world class researcher working on a major data science company",
   verbose=True,
   allow_delegation=False,
   llm=ollama_model,
)
writer = Agent(
   role='Writer',
   goal='Create engaging content',
   backstory="You're a famous technical writer, specialized on writing data related content",
   verbose=True,
   allow_delegation=False,
   llm=ollama_model
)

# Create tasks for your agents
task1 = Task(
   description='Investigate the best way to run python code in a dockere container',
   expected_output="analysis of this as a report in bullet points",
   agent=researcher
)
task2 = Task(
   description='Document this in an easy to understand fashion using markdown format', 
   expected_output="A description in markdown format",
   agent=writer
)

# Instantiate your crew with a sequential process - TWO AGENTS!
crew = Crew(
   agents=[researcher, writer],
   tasks=[task1, task2],
   llm=ollama_model,
   verbose=2,
   process=Process.sequential
)

# Get your crew to work!
result = crew.kickoff()
