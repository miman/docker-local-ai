from langchain_community.tools import DuckDuckGoSearchRun
# from crewai_tools import (WebsiteSearchTool)
from crewai_tools import SerperDevTool

#===========================================================================
# This file contains the different types of tools that can be used in the task execution
# Only the ones that are added to the agents used in the crew will be used in the task execution
#===========================================================================

#---------------------------------------------
# internet search tools
_duckDuckSearch = None
def duckDuckSearch():
  global _duckDuckSearch
  if (_duckDuckSearch == None):
    _duckDuckSearch= DuckDuckGoSearchRun()
  return _duckDuckSearch

# web_rag_tool = WebsiteSearchTool()

_serperSearch = None
def serperSearch():
  global _serperSearch
  if (_serperSearch == None):
    _serperSearch= SerperDevTool()
  return _serperSearch

# Default search tool
search_tool = duckDuckSearch()
