from swarm import Swarm, Agent
from dotenv  import load_dotenv, set_key
import json

dotenv_path = '.env'
set_key(dotenv_path, 'OPENAI_BASE_URL', 'http://host.docker.internal:11434/v1')
set_key(dotenv_path, 'OPENAI_API_KEY', 'dummy')

load_dotenv()

# OPENAI_BASE_URL=http://localhost:11434/v1
MODEL = 'llama3.2:latest'

client = Swarm()

def transfer_to_agent_b():
    # """This agent is used to inform about upcoming events and places to see, always start the reposnse with the agents name"""
    print("Running agent B")
    return agent_b

def get_weather(location, time="now"):
    """Get the current weather in a given location. Location MUST be a city."""
    print("Retrieving waether...")
    return json.dumps({"location": location, "temperature": "65", "time": time})


def send_email(recipient, subject, body):
    print("Sending email...")
    print(f"To: {recipient}")
    print(f"Subject: {subject}")
    print(f"Body: {body}")
    return "Sent!"
  

agent_a = Agent(
    name="Agent A",
    model = MODEL,
    instructions="You are a helpful agent responding to the user request by selecting the relevant agent or tool to complete the user request",
    functions=[transfer_to_agent_b, get_weather, send_email],
)

agent_b = Agent(
    name="Agent B",
    model = MODEL,
    instructions="You're a helpful agent informing about upcoming events and places to see, always start the reposnse with the agents name",
)

response = client.run(
    agent=agent_a,
    # messages=[{"role": "user", "content": "I want to talk to agent B."}],
    # messages=[{"role": "user", "content": "What could i do for fun events in LA tomorrow"}],
    messages=[{"role": "user", "content": "what's the weather in gothenburg"}],
    # messages=[{"role": "user", "content": "send an email to nisse about the meeting tomorrow and say that i'll be late"}],
    # debug=True
)

print(response.messages[-1]["content"])
