from google.adk.agents import Agent
from weather_agent.models import tool_calling_model
from weather_agent.tools import get_weather


root_agent = Agent(
    name="weather_time_agent",
    model=tool_calling_model,
    description=(
        "Agent to answer questions about the time and weather in a city, responds with a markdown formatted response"
    ),
    instruction=(
        "You are a helpful agent who can answer user questions about the time and weather in a city. You use the given tools & then composes a markdown response based on that"
    ),
    tools=[get_weather],
)

# """Review the user's prompt and the available functions listed below.
# First, determine if calling one of these functions is the most appropriate way to respond. A function call is likely needed if the prompt asks for a specific action, requires external data lookup, or involves calculations handled by the functions. If the prompt is a general question or can be answered directly, a function call is likely NOT needed.
# If you determine a function call IS required: Respond ONLY with a JSON object in the format {"name": "function_name", "parameters": {"argument_name": "value"}}. Ensure parameter values are concrete, not variables.
# If you determine a function call IS NOT required: Respond directly to the user's prompt in plain text, providing the answer or information requested. Do not output any JSON."""
