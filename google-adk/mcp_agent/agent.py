from google.adk.agents import Agent
from weather_agent.models import tool_calling_model
from weather_agent.tools import get_weather
from google.adk.tools.mcp_tool.mcp_toolset import MCPToolset, StdioServerParameters
import os

# Fetch current folder path
current_folder_path = os.path.abspath('.')
print(f"Current folder path: {current_folder_path}")


async def fetch_tools():
    """Gets tools from MCP Server & local files."""
    tools, exit_stack = await MCPToolset.from_server(
        # Use StdioServerParameters for local process communication
        connection_params=StdioServerParameters(
            command='npx',  # Command to run the server
            args=["-y",    # Arguments for the command
                  "@modelcontextprotocol/server-filesystem",
                  current_folder_path],
        )
    )

    # add weather service
    tools.append(get_weather)

    return tools, exit_stack


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
