import OpenAI from "openai";
import * as dotenv from 'dotenv';

dotenv.config();

const openai: OpenAI = new OpenAI({
  baseURL: process.env.API_BASE + "/v1",
  apiKey: "not-used", 
});

async function main() {
  try {
    const model: string = process.env.MODEL ?? "granite3.1-dense:2b";
    const completion: OpenAI.Chat.Completions.ChatCompletion = await openai.chat.completions.create({
      model: model,
      messages: [{ role: "user", content: "What is the weather in Toronto?" }],
      tools: [ // Add the 'tools' property
        {
          type: "function",
          function: {
            name: "get_current_weather",
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
          },
        },
        // Add more tools here if needed
      ],
    });

    const context: string[] = [];
    if (completion.choices[0].message.tool_calls && completion.choices[0].message.tool_calls.length > 0) {
      completion.choices[0].message.tool_calls.forEach(toolCall => {
        if (toolCall.type === "function") {
          const reply = handleFnCall(toolCall.function); // Call the function with the tool call data
          context.push(reply);
        }
      });
    }
		// console.log(`response:`, completion);
    console.log("context", context);

  } catch (error) {
    console.error("Error:", error);
  }
}

function handleFnCall(fn: any) {
  // Implement the logic to handle function calls here
  console.log(`Function call received:`, fn);
  const argumentsObject = JSON.parse(fn.arguments);
  // Example: Call a specific function based on the function name
  if (fn.name === "get_current_weather") {
    return getCurrentWeather(argumentsObject.city);
  }
  return "";
}

function getCurrentWeather(city: string) {
  console.log("Getting current weather for:", city);

  return "Current weather in " + city + ": Sunny with a high of 25°C.";
}

main();
