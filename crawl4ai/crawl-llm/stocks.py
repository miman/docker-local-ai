import os
import asyncio
from crawl4ai import AsyncWebCrawler, BrowserConfig, CrawlerRunConfig, CacheMode, LLMConfig
from crawl4ai.extraction_strategy import LLMExtractionStrategy
from pydantic import BaseModel, Field
from dotenv import load_dotenv
import os

# In this file we scrape a web-page using crawl4ai running in Docker, send this to an LLM to fetch the relevant parts & format it & print out the output from the LLM
# The LLM config recides in the .env file in the root folder of the project (2 steps up)

load_dotenv('../../.env')

# The CSS selector ensures the LLM only looks at this specific block of content
cssSelector: str = "[class^='product-zone__items']"


class OpenAIModelFee(BaseModel):
    model_name: str = Field(..., description="Name of the OpenAI model.")
    input_fee: str = Field(...,
                           description="Fee for input token for the OpenAI model.")
    output_fee: str = Field(...,
                            description="Fee for output token for the OpenAI model.")


async def main():
    browser_config = BrowserConfig(verbose=True)
    run_config = CrawlerRunConfig(
        word_count_threshold=1,
        css_selector=cssSelector,
        extraction_strategy=LLMExtractionStrategy(
            # Here you can use any provider that Litellm library supports, for instance: ollama/qwen2
            # provider="ollama/qwen2", api_token="no-token",
            llm_config=LLMConfig(provider=os.getenv('OLLAMA_LLM_MODEL'),  # OLLAMA_LLM_MODEL, GEMINI_LLM_MODEL
                                 #  base_url="http://host.docker.internal:11434",    # Uncomment if you use Ollama running in docker
                                 api_token=os.getenv('GEMINI_API_KEY')),
            schema=OpenAIModelFee.model_json_schema(),
            extraction_type="schema",
            instruction="""From the crawled content, extract all stock information & prices. 
            Do not miss any stocks in the entire content. One extracted model JSON format should look like this: 
            {"stock_tag": "NVDA", "name": "Nvidia", "price": "30.00", "change": "+5.41"}."""
        ),
        cache_mode=CacheMode.BYPASS,
    )

    async with AsyncWebCrawler(config=browser_config) as crawler:
        result = await crawler.arun(
            url='https://edition.cnn.com/markets',
            config=run_config
        )
        print(result.extracted_content)

if __name__ == "__main__":
    asyncio.run(main())
