/**
 * Dummy weather fn
 * @param args 
 * @returns 
 */
function getCurrentWeather(args: { city: string }) {
  console.log("Getting current weather for:", args);

  return "Current weather in " + args.city + ": Sunny with a high of 25°C.";
}

/**
 * Dummy weather fn
 * @param args 
 * @returns 
 */
function getFuelEfficiency(args: { distance: number, fuelUsed: number }): number{
  console.log("Getting Fuel Efficiency for:", args);

  return args.distance/args.fuelUsed;
}

export const availableFunctions: Map<string, any> = new Map<string, any>();

availableFunctions.set("getCurrentWeather", getCurrentWeather);
availableFunctions.set("getFuelEfficiency", getFuelEfficiency);

const getCurrentWeatherTool: any = {
  type: "function",
  function: {
    name: "getCurrentWeather",
    description: "Gets the current weather for a city",
    parameters: {
      type: "object",
      properties: {
        city: {
          type: "string",
          description: "The city to get the weather for",
        },
      },
      required: ["city"],
    },
  }
};

const getFuelEfficiencyTool: any = {
  type: "function",
  function: {
    name: "getFuelEfficiency",
    description: "Returns the fuel efficiency based on the given distance travelled & the amount of fuel used for a vehicle",
    parameters: {
      type: "object",
      properties: {
        distance: {
          type: "number",
          description: "The distance travelled",
        },
        fuelUsed: {
          type: "number",
          description: "The amount of fuel used",
        },
      },
      required: ["distance", "fuelUsed"],
    },
  }
};

export const tools: any[] = [getCurrentWeatherTool, getFuelEfficiencyTool];
