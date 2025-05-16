import asyncio
from crawl4ai import AsyncWebCrawler

# In this file we run crawl4ai locally & print out the content of the fetched web page


async def main():
    async with AsyncWebCrawler() as crawler:
        response = await crawler.arun(
            url="https://www.nbcnews.com/business",
        )
        # write some output from the retrieved page
        response_json = response.model_dump_json(indent=2)
        print(response_json)
        print(f"status_code: {response.status_code}")

if __name__ == "__main__":
    asyncio.run(main())
