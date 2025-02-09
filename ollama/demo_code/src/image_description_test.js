import OpenAI from "openai";
import fs from "fs/promises"; // For reading image files
import * as dotenv from 'dotenv';

dotenv.config();

const openai = new OpenAI({
	baseURL: process.env.API_BASE + "/v1", // Your Ollama base URL
	apiKey: "not-used", // Required but unused
});

async function describeImage(imagePath) {
	try {
		// 1. Read the image file
		const imageBuffer = await fs.readFile(imagePath);
		const base64Image = imageBuffer.toString("base64");

		// 2. Create the chat completion request (Llava style)
		const completion = await openai.chat.completions.create({
			model: process.env.LLAVA_MODEL, // Or the name of your Llava model in Ollama
			messages: [
				{
					role: "user",
					content: [
						{ type: "text", text: "Describe this image:" },
						{ type: "image_url", image_url: { url: `data:image/png;base64,${base64Image}` } }, // Or appropriate MIME type
					],
				},
			],
			max_tokens: 512, // Adjust as needed
		});

		// 3. Extract and print the description
		const description = completion.choices[0].message.content;
		console.log(description);
		return description; // Return the description if you need it elsewhere
	} catch (error) {
		console.error("Error describing image:", error);
		return null; // Or throw the error if you want it to propagate
	}
}

async function main() {
	const imagePath = "./resources/schnauser-on-beach.png"; // Replace with the actual path to your image
	const description = await describeImage(imagePath);
	if (description) {
		console.log("Image description obtained successfully!");
	}
}

main();
