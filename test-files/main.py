from crewai import Task
from team import execute

folderPath = 'output'
# Define the tasks to perform
task_investigate = Task(
  description="""Find the weather and tempature in Gothenburg in Sweden tomorrow and compare this to the the weather the last 10 years for the same date""",
  expected_output="the weather and tempature in Gothenburg tomorrow and for each of the last 10 years in a bulletlist",
)

task_documentation = Task(
  description="""Create a documentation describing the weather tomorrow, how it has been historically and how they compare in a markdown format""",
  expected_output="Tomorrows weather, how it has been historically and how they compare in markdown format",
  output_file=folderPath + '/output.md'  # The output will be saved here
)

# Execute  the tasks
execute([task_investigate, task_documentation])
