from crewai import Crew, Process
from dotenv import load_dotenv
load_dotenv()
import os
from general_agents import researcher, writer
from llms import manager_llm

#===========================================================================
# The execution in this file is used if you want the tasks to be executed by a developer team
#===========================================================================

# Instantiate your crew with a sequential process
crewLoggingLvlStr: str | None = os.getenv('CREW_LOGGING_LEVEL')
crewLoggingLvl: bool = False

if (crewLoggingLvlStr):
   crewLoggingLvl = bool(crewLoggingLvlStr)

def execute(tasks):
   crew = Crew(
      agents=[researcher(), writer()],
      tasks=tasks,
      verbose=crewLoggingLvl, # You can set it to 1 or 2 to different logging levels
      manager_llm=manager_llm,  # Mandatory for hierarchical process
      process=Process.hierarchical
   )

   # Get your crew to work!
   result = crew.kickoff()

   print("###########")
   print(result)