import json
from typing import Type
from crewai.tools import BaseTool
from pydantic import BaseModel, Field
from cai_test.tools.telematic_data import create_gps_data


class TelematicVehicleDataInput(BaseModel):
    vehicle: str = Field(..., description="The name of the vehicle/truck")


class TelematicVehicleDataTool(BaseTool):
    name: str = "TelematicVehicleDataTool"
    description: str = (
        """Get current telematic information about a vehicle
      Useful to use when any realtime information is needed for a vehicle such as 
      vehicle location, who is driving the vehicle, the current speed, fuel level...
      It will output a JSON with the current telematic information of that vehicle formatted as follows:
      {
        "latitude": 11.2,
        "longitude": 12.3,
        "speed": 123,
        "fuel": 123,
        "odometer": 123
      }
      """
    )
    args_schema: Type[BaseModel] = TelematicVehicleDataInput

    def _run(self, vehicle: str):
        print(f"Received input: {vehicle}")
        return json.dumps(create_gps_data(vehicle))


class DriverTimeInput(BaseModel):
    vehicle: str = Field(...,
                         description="The name of the vehicle the driver is driving")


class DriverTimeTool(BaseTool):
    name: str = "DriverTimeTool"
    description: str = (
        """Returns the current driver times for the driver that is driving the given vehicle"""
    )
    args_schema: Type[BaseModel] = DriverTimeInput

    def _run(self, vehicle: str):
        print(f"Drv Received input: vehicle={vehicle}")
        return json.dumps({"driver": "John Smith", "driving": 4.5, "resting": 1.2, "working": 2.1})
