from google.adk.models.lite_llm import LiteLlm
import os
from dotenv import load_dotenv

load_dotenv()

# LLM definition
OPENAI_API_KEY = os.environ["OPENAI_API_KEY"]
print(f"OPENAI_API_KEY: {OPENAI_API_KEY}")

ollama_model = LiteLlm(
    model="openai/qwen2.5:3b",
    # api_base="http://host.docker.internal:11434"
    api_base="http://192.168.68.130:11434/v1"
)

# Base model
base_model = ollama_model

# LLM model capable of calling tools
tool_calling_model = ollama_model
