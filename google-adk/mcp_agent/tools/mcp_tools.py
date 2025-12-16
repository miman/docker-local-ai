from google.adk.tools.mcp_tool.mcp_toolset import MCPToolset, StdioServerParameters
import os
from mcp_agent.tools.tools import get_weather

# Fetch current folder path
current_folder_path = os.path.abspath('.')
print(f"Current folder path: {current_folder_path}")


async def fetch_tools():
    """Gets tools from MCP Server & local files."""

    # add weather service
    tools = [get_weather]

    file_tools, file_exit_stack = await MCPToolset.from_server(
        # Use StdioServerParameters for local process communication
        connection_params=StdioServerParameters(
            command='npx',  # Command to run the server
            args=["-y",    # Arguments for the command
                  "@modelcontextprotocol/server-filesystem",
                  current_folder_path],
        )
    )

    tools.extend(file_tools)

    fetch_tools, fetch_exit_stack = await MCPToolset.from_server(
        # Use StdioServerParameters for local process communication
        connection_params=StdioServerParameters(
            command='npx',  # Command to run the server
            args=[
                "-y",
                "duckduckgo-mcp-server"],
        )
    )

    tools.extend(fetch_tools)

    return tools, fetch_exit_stack
