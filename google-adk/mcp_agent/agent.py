from google.adk.agents import Agent
from mcp_agent.tools.mcp_tools import fetch_tools
from weather_agent.models import tool_calling_model


async def create_agent():
    """Creates the agent with all suported tools"""
    tools, exit_stack = await fetch_tools()

    agent = Agent(
        name="mcp_test_agent",
        model=tool_calling_model,
        description=(
            "Agent to answer questions using tools, responds with a markdown formatted response"
        ),
        instruction=(
            "You are a helpful agent who uses tools to answ answer user questions . You use the given tools & then composes a markdown response based on that"
        ),
        tools=tools,
    )
    return agent, exit_stack


root_agent = create_agent()

# """Review the user's prompt and the available functions listed below.
# First, determine if calling one of these functions is the most appropriate way to respond. A function call is likely needed if the prompt asks for a specific action, requires external data lookup, or involves calculations handled by the functions. If the prompt is a general question or can be answered directly, a function call is likely NOT needed.
# If you determine a function call IS required: Respond ONLY with a JSON object in the format {"name": "function_name", "parameters": {"argument_name": "value"}}. Ensure parameter values are concrete, not variables.
# If you determine a function call IS NOT required: Respond directly to the user's prompt in plain text, providing the answer or information requested. Do not output any JSON."""
