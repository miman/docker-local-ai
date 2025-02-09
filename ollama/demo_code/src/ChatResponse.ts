interface ToolCall {
  id: string;
  index: number;
  type: 'function';
  function: {
    name: string;
    arguments: string; // JSON string of arguments
  };
}

interface Message {
  role: 'assistant' | 'user' | 'system'; // Add other roles if needed
  content: string;
  tool_calls?: ToolCall[]; // Make tool_calls optional
}

interface Choice {
  index: number;
  message: Message;
  finish_reason: 'tool_calls' | 'stop' | null; // Add other finish reasons as needed
}

interface Usage {
  prompt_tokens: number;
  completion_tokens: number;
  total_tokens: number;
}

interface ChatCompletionResponse {
  id: string;
  object: 'chat.completion';
  created: number;
  model: string;
  system_fingerprint?: string; // Optional system fingerprint
  choices: Choice[];
  usage: Usage;
}
