import OpenAI from "openai";
import { askLlmWithTools, model, openai } from "./ask_llm_with_tools.js";

/**
 * This is an exampke function that will do 2 different requests
 */
async function main(): Promise<void> {
  try {
    await askAboutWeather();
    console.log('\n');
    await askAboutVehicle();

  } catch (error) {
    console.error("Error:", error);
  }
}

/**
 * Ask about the current weather, which should return that we should use the getCurrentWeather tool
 */
async function askAboutWeather(): Promise<void> {
  const reply: string[] = await askLlmWithTools("What is the weather in Toronto?");
  console.log("Weather response", reply);
}


/**
 * Ask about the vehicle info, which should return that we should use the getFuelEfficiency & getVehicleTelematicData tools
 * A second question is then sent to the LLM to compose an answer based on the calculated information
 */
async function askAboutVehicle(): Promise<void> {
  const question2: string = "What is the fuel efficiency for the vehicle called red truck if it used 20 litres of fuel when driving the distance 400 km & where is its last known position?";
  const reply2: string[] = await askLlmWithTools(question2);
  console.log("Fuel efficiency tools response", reply2);


  let summaryQuestion: string = `Compose a response for the question based on this information. \n\nOriginal question: '${question2}'\n\n Calculated information for the response:`;
  reply2.forEach((response: string) => {
    summaryQuestion += `\n\n${response}`;
  });
  const completion: OpenAI.Chat.Completions.ChatCompletion = await openai.chat.completions.create({
    model: model,
    messages: [{ role: "user", content: summaryQuestion }],
  });
  console.log("\nSummary completion response: \n", completion.choices[0].message.content);
}

// Run the main function
main();
