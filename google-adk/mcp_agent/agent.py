# ./adk_agent_samples/mcp_agent/agent.py
import asyncio
from dotenv import load_dotenv
from google.genai import types
from google.adk.agents.llm_agent import LlmAgent
from google.adk.runners import Runner
from google.adk.sessions import InMemorySessionService
from google.adk.artifacts.in_memory_artifact_service import InMemoryArtifactService  # Optional
from google.adk.tools.mcp_tool.mcp_toolset import MCPToolset, SseServerParams, StdioServerParameters
from google.adk.models.lite_llm import LiteLlm
import os

# Load environment variables from .env file in the parent directory
# Place this near the top, before using env vars like API keys
load_dotenv('../.env')

# LLM definition
OLLAMA_URL = os.environ["OLLAMA_URL"]
print(f"OLLAMA_URL: {OLLAMA_URL}")
LLM_MODEL = os.environ["LLM_MODEL"]
print(f"LLM_MODEL: {LLM_MODEL}")

ollama_model = LiteLlm(
    model="openai/" + LLM_MODEL,
    api_base=OLLAMA_URL
)

# LLM model capable of calling tools
tool_calling_model = ollama_model

# --- Step 1: Import Tools from MCP Server ---


async def get_tools_async():
    """Gets tools from the File System MCP Server."""
    print("Attempting to connect to MCP Filesystem server...")
    tools, exit_stack = await MCPToolset.from_server(
        # Use StdioServerParameters for local process communication
        connection_params=StdioServerParameters(
            command='npx',  # Command to run the server
            args=["-y",    # Arguments for the command
                  "@modelcontextprotocol/server-filesystem",
                  # TODO: IMPORTANT! Change the path below to an ABSOLUTE path on your system.
                  "/workspaces/google-adk/mcp_agent"],
        )
        # For remote servers, you would use SseServerParams instead:
        # connection_params=SseServerParams(url="http://remote-server:port/path", headers={...})
    )
    print("MCP Toolset created successfully.")
    # MCP requires maintaining a connection to the local MCP Server.
    # exit_stack manages the cleanup of this connection.
    return tools, exit_stack

# --- Step 2: Agent Definition ---


async def get_agent_async():
    """Creates an ADK Agent equipped with tools from the MCP Server."""
    tools, exit_stack = await get_tools_async()
    print(f"Fetched {len(tools)} tools from MCP server.")
    root_agent = LlmAgent(
        model=tool_calling_model,  # Adjust model name if needed based on availability
        name='filesystem_assistant',
        instruction='Help user interact with the local filesystem using available tools.',
        tools=tools,  # Provide the MCP tools to the ADK agent
    )
    return root_agent, exit_stack

# --- Step 3: Main Execution Logic ---


async def async_main():
    session_service = InMemorySessionService()
    # Artifact service might not be needed for this example
    artifacts_service = InMemoryArtifactService()

    session = session_service.create_session(
        state={}, app_name='mcp_filesystem_app', user_id='user_fs'
    )

    # TODO: Change the query to be relevant to YOUR specified folder.
    # e.g., "list files in the 'documents' subfolder" or "read the file 'notes.txt'"
    query = "list files in the /workspaces/google-adk/mcp_agent folder"
    print(f"User Query: '{query}'")
    content = types.Content(role='user', parts=[types.Part(text=query)])

    root_agent, exit_stack = await get_agent_async()

    runner = Runner(
        app_name='mcp_filesystem_app',
        agent=root_agent,
        artifact_service=artifacts_service,  # Optional
        session_service=session_service,
    )

    print("Running agent...")
    events_async = runner.run_async(
        session_id=session.id, user_id=session.user_id, new_message=content
    )

    async for event in events_async:
        print(f"Event received: {event}")

    # Crucial Cleanup: Ensure the MCP server process connection is closed.
    print("Closing MCP server connection...")
    await exit_stack.aclose()
    print("Cleanup complete.")

if __name__ == '__main__':
    try:
        asyncio.run(async_main())
    except Exception as e:
        print(f"An error occurred: {e}")
