import OpenAI from "openai";
import * as dotenv from 'dotenv';

dotenv.config();

const openai = new OpenAI({
	baseURL: process.env.API_BASE + "/v1",
	apiKey: "not-used", // required but unused
});

const completion = await openai.chat.completions.create({
	model: process.env.MODEL,
	messages: [{ role: "user", content: "Why is the sky blue?" }],
});

console.log(completion.choices[0].message.content);
