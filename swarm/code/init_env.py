from dotenv  import load_dotenv, set_key

def initEnv():
  dotenv_path = '.env'
  set_key(dotenv_path, 'OPENAI_BASE_URL', 'http://host.docker.internal:11434/v1')
  set_key(dotenv_path, 'OPENAI_API_KEY', 'dummy')
  load_dotenv()