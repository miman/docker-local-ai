import asyncio
import requests

# In this file we scrape a web-page using crawl4ai running in Docker & print out the content of the fetched web page


async def main():
    response = requests.post(
        "http://host.docker.internal:11235/crawl",
        json={"urls": ["https://www.nbcnews.com/business"], "priority": 10}
    )
    # Create JSON string of response object
    response_json = response.model_dump_json(indent=2)
    print("response" + str(response_json))
    print(f"task_id: {response["task_id"]}")

    print(response)

if __name__ == "__main__":
    asyncio.run(main())
