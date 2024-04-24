from langchain_community.tools import DuckDuckGoSearchRun
# from crewai_tools import (WebsiteSearchTool)

#===========================================================================
# This file contains the different types of tools that can be used in the task execution
# Only the ones that are added to the agents used in the crew will be used in the task execution
#===========================================================================

#---------------------------------------------
# Search tools
duckDuckSearch = DuckDuckGoSearchRun()
# web_rag_tool = WebsiteSearchTool()

# Default search tool
search_tool = duckDuckSearch
