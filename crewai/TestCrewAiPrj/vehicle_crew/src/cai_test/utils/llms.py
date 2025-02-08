import os
from crewai import LLM
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

# General LLMs
_qwen_llm = None
def qwen_llm():
    global _qwen_llm  # Mark as global
    if (_qwen_llm == None):
        _qwen_llm = LLM(model="ollama/qwen2.5:0.5b", base_url=ollamaApiBaseUrl)
    return _qwen_llm

_granite_llm = None
def granite_llm():
    global _granite_llm  # Mark as global
    if (_granite_llm == None):
        _granite_llm = LLM(model="ollama/granite3.1-dense:2b", base_url=ollamaApiBaseUrl)
    return _granite_llm

_ollama_llm = None
def ollama_llm():
    global _ollama_llm  # Mark as global
    if (_ollama_llm == None):
        _ollama_llm = LLM(model="ollama/llama3.2", base_url=ollamaApiBaseUrl)
    return _ollama_llm

_mistral = None
def mistral():
    global _mistral  # Mark as global
    if (_mistral is None):
        _mistral = LLM(model='ollama/mistral', base_url=ollamaApiBaseUrl)
    return _mistral

_openhermes = None
def openhermes():
    global _openhermes  # Mark as global
    if (_openhermes is None):
        _openhermes = LLM(model='ollama/openhermes', base_url=ollamaApiBaseUrl)
    return _openhermes

_gemma = None
def gemma():
    global _gemma
    if (_gemma == None):
        _gemma = LLM(model='ollama/gemma2', base_url=ollamaApiBaseUrl)
    return _gemma

_llama3 = None
def llama3():
    global _llama3
    if (_llama3 == None):
        _llama3 = LLM(model='ollama/llama3.2', base_url=ollamaApiBaseUrl)
    return _llama3

# Code LLMs
_codellama = None
def codellama():
    global _codellama
    if (_codellama is None):
        _codellama = LLM(model='ollama/codellama', base_url=ollamaApiBaseUrl)
    return _codellama

_codeqwen = None
def codeqwen():
    global _codeqwen
    if (_codeqwen == None):
        _codeqwen = LLM(model='ollama/codeqwen', base_url=ollamaApiBaseUrl)
    return _codeqwen

_dolphin_llama_llm = None
def dolphin_llama_llm():
    global _dolphin_llama_llm  # Mark as global
    if (_dolphin_llama_llm == None):
        _dolphin_llama_llm = LLM(model="ollama/dolphin-llama3", base_url=ollamaApiBaseUrl)
    return _dolphin_llama_llm

# Image recognition LLM
_llava_llm = None
def llava_llm():
    global _llava_llm  # Mark as global
    if (_llava_llm == None):
        _llava_llm = LLM(model="ollama/llava", base_url=ollamaApiBaseUrl)
    return _llava_llm

# Medical LLM
_meditron_llm = None
def meditron_llm():
    global _meditron_llm  # Mark as global
    if (_meditron_llm == None):
        _meditron_llm = LLM(model="ollama/meditron", base_url=ollamaApiBaseUrl)
    return _meditron_llm


# ===================================
# OpenAPI configuration
# _openai_llm = None
# def openai_llm():
#     global _openai_llm
#     if (_openai_llm == None):
#         openApiKey: str | None = os.getenv('OPENAI_API_KEY')
#         openApiModel: str | None = os.getenv('OPENAI_MODEL_NAME')

#         if (openApiKey):
#             # os.environ["OPENAI_API_KEY"] = os.getenv('OPENAI_API_KEY')
#             # os.environ['OPENAI_MODEL_NAME'] = os.getenv('OPENAI_MODEL_NAME')
#             _openai_llm = ChatOpenAI(model=openApiModel, api_key=openApiKey, verbose=True)
#     return _openai_llm

# ========================================
# LLM per role
manager_llm = granite_llm()
def researcher_llm():
    return granite_llm()

def writer_llm():
    return granite_llm()

def coder_llm():
    return granite_llm()

def tester_llm():
    return granite_llm()

#ChatOpenAI(temperature=0, api_key=openApiKey, model=openApiModel, verbose=True)
