import datetime
from zoneinfo import ZoneInfo
from google.adk.agents import Agent
from weather_agent.models import tool_calling_model
from weather_agent.tools import get_weather


def get_current_time(city: str) -> dict:
    """Returns the current time in a specified city.

    Args:
        city (str): The name of the city for which to retrieve the current time.

    Returns:
        dict: status and result or error msg.
    """

    if city.lower() == "new york":
        tz_identifier = "America/New_York"
    else:
        return {
            "status": "error",
            "error_message": (
                f"Sorry, I don't have timezone information for {city}."
            ),
        }

    tz = ZoneInfo(tz_identifier)
    now = datetime.datetime.now(tz)
    report = (
        f'The current time in {city} is {now.strftime("%Y-%m-%d %H:%M:%S %Z%z")}'
    )
    return {"status": "success", "report": report}


root_agent = Agent(
    name="weather_time_agent",
    model=tool_calling_model,
    description=(
        "Agent to answer questions about the time and weather in a city. responds with a markdown formatted response"
    ),
    instruction=(
        "You are a helpful agent who can answer user questions about the time and weather in a city. You use the given tools & then composes a markdown response based on that"
    ),
    tools=[get_weather, get_current_time],
)
