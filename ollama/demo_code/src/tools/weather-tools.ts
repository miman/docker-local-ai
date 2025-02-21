/**
 * Dummy weather fn
 * @param args 
 * @returns 
 */
export function getCurrentWeather(args: { city: string }) {
  console.log("Getting current weather for:", args);

  return "Current weather in " + args.city + ": Sunny with a high of 25°C.";
}

export const getCurrentWeatherTool: any = {
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
