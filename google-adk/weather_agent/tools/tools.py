# Define a tool function
from typing import Dict


def get_capital_city(country: str) -> str:
    """Retrieves the capital city for a given country."""
    # Replace with actual logic (e.g., API call, database lookup)
    capitals = {"france": "Paris", "japan": "Tokyo", "canada": "Ottawa"}
    return capitals.get(country.lower(), f"Sorry, I don't know the capital of {country}.")


def get_weather(city: str) -> Dict:

    # Best Practice: Log tool execution for easier debugging
    print(f"--- Tool: get_weather called for city: {city} ---")
    city_normalized = city.lower().replace(" ", "")  # Basic input normalization

    # Mock weather data for simplicity (matching Step 1 structure)
    mock_weather_db = {
        "newyork": {"status": "success", "report": "The weather in New York is sunny with a temperature of 25°C."},
        "london": {"status": "success", "report": "It's cloudy in London with a temperature of 15°C."},
        "tokyo": {"status": "success", "report": "Tokyo is experiencing light rain and a temperature of 18°C."},
        "chicago": {"status": "success", "report": "The weather in Chicago is sunny with a temperature of 25°C."},
        "toronto": {"status": "success", "report": "It's partly cloudy in Toronto with a temperature of 30°C."},
        "chennai": {"status": "success", "report": "It's rainy in Chennai with a temperature of 15°C."},
    }

    # Best Practice: Handle potential errors gracefully within the tool
    if city_normalized in mock_weather_db:
        return mock_weather_db[city_normalized]
    else:
        return {"status": "error", "error_message": f"Sorry, I don't have weather information for '{city}'."}
