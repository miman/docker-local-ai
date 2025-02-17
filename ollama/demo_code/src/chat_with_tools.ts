import OpenAI from "openai";
import * as dotenv from 'dotenv';
import { availableFunctions, tools } from "./tools.js";

dotenv.config();

const openai: OpenAI = new OpenAI({
  baseURL: process.env.API_BASE + "/v1",
  apiKey: "not-used", 
});

async function askLlmWithTools(question: string): Promise<string[]> {
  try {
    const model: string = process.env.MODEL ?? "granite3.1-dense:2b";
    const completion: OpenAI.Chat.Completions.ChatCompletion = await openai.chat.completions.create({
      model: model,
      messages: [{ role: "user", content: question }],
      tools: tools,
    });

    const context: string[] = [];
    // console.log(`returned completion: `, completion?.choices[0]?.message?.tool_calls)
    if (completion.choices[0].message.tool_calls && completion.choices[0].message.tool_calls.length > 0) {
      completion.choices[0].message.tool_calls.forEach(toolCall => {
        if (toolCall.type === "function") {
          const reply = handleFnCall(toolCall.function.name, toolCall.function.arguments); // Call the function with the tool call data
          context.push(reply);
        }
      });
    }
		// console.log(`response:`, completion);
    return context;
  } catch (error) {
    console.error("Error:", error);
    throw error;
  }
}

  /**
   * Implement the logic to handle function calls here
   * @param fnName the name of the function to call
   * @param args The arguments to give to the function (as a string)
   * @returns The return value of the given fn call
   */
  function handleFnCall(fnName: string, args: string): string {
    const functionToCall: any = availableFunctions.get(fnName);
    if (functionToCall) {
        console.log('Calling function:', fnName);
        console.log('Arguments:', args);
        const argsObj = JSON.parse(args);
        const output = functionToCall(argsObj);
        // console.log('Function output:', output);

        return output.toString();
    } else {
      console.log('Calling unknown function:', fnName);
      return "";
    }
}

async function main() {
  try {
    const reply: string[] = await askLlmWithTools("What is the weather in Toronto?");
    console.log("Weather response", reply);

    const reply2: string[] = await askLlmWithTools("What is the fuel efficiency for the red truck if it used 20 litres of fuel when driving the distance 400 km?");
    console.log("Fuel efficiency response", reply2);

  } catch (error) {
    console.error("Error:", error);
  }
}

main();
