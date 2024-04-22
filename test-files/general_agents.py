from crewai import Agent
from llms import researcher_llm, writer_llm
from tools import search_tool

#===========================================================================
# This file contains all types of agents that can be used in a crew
# Only the ones that are added to the crew will be used in the task execution
#===========================================================================

# Define your agents with roles and goals
_researcher = None
def researcher():
    global _researcher
    if (_researcher == None):
        _researcher = Agent(
                    role='Researcher',
                    goal='Conduct in-depth analysis',
                    backstory="""You work at a leading tech think tank.
                    Your expertise lies in identifying emerging trends.
                    You have a knack for dissecting complex data and presenting actionable insights.""",
                    verbose=True,
                    allow_delegation=False,
                    llm=researcher_llm(),
                    tools=[search_tool]
                )
    return _researcher

_writer = None
def writer():
    global _writer
    if (_writer == None):
        _writer = Agent(
            role='Writer',
            goal='Create engaging content',
            backstory="""You are a renowned Content Strategist, known for your insightful and engaging articles.
            You transform complex concepts into compelling narratives.""",
            verbose=True,
            llm=writer_llm(),
            allow_delegation=False
        )
    return _writer
