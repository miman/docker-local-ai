from crewai.tools import BaseTool
from typing import Type
from pydantic import BaseModel, Field
import numexpr


class CalcToolInput(BaseModel):
    """Input schema for MyCustomTool."""
    argument: str = Field(...,
                          description="a mathematical task, such as '2+3' or '45*12'")


class CalcTool(BaseTool):
    name: str = "CalcTool"
    description: str = (
        "This calculates the given mathematical task, such as '2+3' or '45*12'"
    )
    args_schema: Type[BaseModel] = CalcToolInput

    def _run(self, argument: str) -> str:
        try:
            print(f"CalcTool input: '{argument}'")
            result = numexpr.evaluate(argument)
            print(f"CalcTool result: {result}")
            return str(result)
        except Exception as e:
            print(f"Error in CalcTool: {e}")
            return f"Invalid input. {e}"
