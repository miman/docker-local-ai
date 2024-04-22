from langchain_openai import ChatOpenAI
from langchain_community.llms.ollama import Ollama
import os
from dotenv import load_dotenv
load_dotenv()

#===========================================================================
# This file contains the different types of LLM's that can be used in the task execution
# Only the ones that are added to the agents used in the crew will be used in the task execution
#===========================================================================

# ===================================
# Ollama configuration
ollamaApiBaseUrl: str | None = os.getenv('OLLAMA_API_BASE')

if ollamaApiBaseUrl is None:
    ollamaApiBaseUrl = "http://host.docker.internal:11434"

_ollama_llm = None
def ollama_llm():
    global _ollama_llm  # Mark as global
    if (_ollama_llm == None):
        _ollama_llm = Ollama(model="llama2", base_url=ollamaApiBaseUrl)
    return _ollama_llm

_mistral = None
def mistral():
    global _mistral  # Mark as global
    if (_mistral is None):
        _mistral = Ollama(model='mistral', base_url=ollamaApiBaseUrl)
    return _mistral

_openhermes = None
def openhermes():
    global _openhermes  # Mark as global
    if (_openhermes is None):
        _openhermes = Ollama(model='openhermes', base_url=ollamaApiBaseUrl)
    return _openhermes

_codellama = None
def codellama():
    global _codellama
    if (_codellama is None):
        _codellama = Ollama(model='codellama', base_url=ollamaApiBaseUrl)
    return _codellama

_gemma = None
def gemma():
    global _gemma
    if (_gemma == None):
        _gemma = Ollama(model='gemma:2b', base_url=ollamaApiBaseUrl)
    return _gemma

_llama3 = None
def llama3():
    global _llama3
    if (_llama3 == None):
        _llama3 = Ollama(model='llama3', base_url=ollamaApiBaseUrl)
    return _llama3

_codeqwen = None
def codeqwen():
    global _codeqwen
    if (_codeqwen == None):
        _codeqwen = Ollama(model='codeqwen', base_url=ollamaApiBaseUrl)
    return _codeqwen

_dolphin_llama_llm = None
def dolphin_llama_llm():
    global _dolphin_llama_llm  # Mark as global
    if (_dolphin_llama_llm == None):
        _dolphin_llama_llm = Ollama(model="dolphin-llama3", base_url=ollamaApiBaseUrl)
    return _dolphin_llama_llm


# ===================================
# OpenAPI configuration
_openai_llm = None
def openai_llm():
    global _openai_llm
    if (_openai_llm == None):
        openApiKey: str | None = os.getenv('OPENAI_API_KEY')
        openApiModel: str | None = os.getenv('OPENAI_MODEL_NAME')

        if (openApiKey):
            # os.environ["OPENAI_API_KEY"] = os.getenv('OPENAI_API_KEY')
            # os.environ['OPENAI_MODEL_NAME'] = os.getenv('OPENAI_MODEL_NAME')
            _openai_llm = ChatOpenAI(model=openApiModel, api_key=openApiKey, verbose=True)
    return _openai_llm

# ========================================
# LLM per role
manager_llm = gemma()
def researcher_llm():
    return gemma()

def writer_llm():
    return gemma()

def coder_llm():
    return gemma()

def tester_llm():
    return gemma()

#ChatOpenAI(temperature=0, api_key=openApiKey, model=openApiModel, verbose=True)
