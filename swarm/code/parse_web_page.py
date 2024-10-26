from bs4 import BeautifulSoup
import requests

# Strips HTML tags and returns only the text from the given web page content
def getWebPageContent(pageRawContent):
    # Parse the HTML
    soup = BeautifulSoup(pageRawContent, 'lxml')

    # Remove all script and style elements
    for script_or_style in soup(['script', 'style']):
        script_or_style.decompose()  # Removes the tags and their content

    # Get text from the HTML
    text = soup.get_text()

    # Break into lines and remove leading and trailing space on each
    lines = (line.strip() for line in text.splitlines())

    # Remove the blank lines
    clean_text = '\n'.join(line for line in lines if line)

    return clean_text

#   Fetches the raw content of a webpage
def getWebpagePayload(url):
    response = requests.get(url)
    response.encoding = 'utf-8'  # Ensure UTF-8 encoding

    if response.status_code == 200:
        data = response.text
        return data
    else:
        print(f"Failed to retrieve data: {response.status_code}")
        return ""
        

# Fetches the text payload of a webpage (without HTML tags, javascript...)
def getWebpageText(url):
    response = requests.get(url)
    response.encoding = 'utf-8'  # Ensure UTF-8 encoding

    # print("Headers:", response.headers)

    if response.status_code == 200:
        data = response.text
        # Check if the Content-Type is 'text/html'
        content_type = response.headers.get('Content-Type', '')
        if content_type.startswith('text/html'):
            return getWebPageContent(data)
        else:
            print(f"The Content-Type is not 'text/html' but {response.headers.get('Content-Type')}")
            return ""
    else:
        print(f"Failed to retrieve data: {response.status_code}")
        return ""
        
