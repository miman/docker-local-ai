from google.adk.models.lite_llm import LiteLlm
import os
from dotenv import load_dotenv

load_dotenv()

# LLM definition
OLLAMA_URL = os.environ["OLLAMA_URL"]
print(f"OLLAMA_URL: {OLLAMA_URL}")
LLM_MODEL = os.environ["LLM_MODEL"]
print(f"LLM_MODEL: {LLM_MODEL}")

ollama_model = LiteLlm(
    model="openai/" + LLM_MODEL,
    api_base=OLLAMA_URL
)

# Base model
base_model = ollama_model

# LLM model capable of calling tools
tool_calling_model = ollama_model
