
from enum import Enum
import random

class Trucks(Enum):
    RED = 1
    BLUE = 2
    JOHNS = 3
    JANES = 4
    DUMPER = 5
    GREEN = 6

def _generate_random_value(from_value, to_value):
  """
  This function generates a random number between the given 'from_value' (inclusive) and 'to_value' (inclusive)
  """
  # Ensure from_value is less than or equal to to_value
  if from_value > to_value:
    raise ValueError("from_value must be less than or equal to to_value")
  
  # Random float between 0.0 (inclusive) and 1.0 (exclusive)
  random_float = random.random()
  # Scale the random value to the desired range
  value_range = to_value - from_value
  random_value = random_float * value_range + from_value
  return random_value

def create_gps_data(name):
  # Create an empty dictionary to represent the GPS data
  gps_data = {}
  snapshot_data = {}

  # The outer dictionary with the "gps" key
  data = {"gps": gps_data,
          "snapshot": snapshot_data,
          "name": name
        }

  # You can now add more data to the "gps_data" dictionary
  # For example, adding latitude and longitude
  gps_data["latitude"] = _generate_random_value(-90, 90)
  gps_data["longitude"] = _generate_random_value(-180, 180)
  gps_data["speed"] = _generate_random_value(0, 180)
  
  snapshot_data["fuel"] = _generate_random_value(0, 200)
  snapshot_data["odometer"] = _generate_random_value(0, 10000)

  return data
