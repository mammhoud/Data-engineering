import requests
from bs4 import BeautifulSoup

def scrape_website(url):
    # Send an HTTP GET request to the URL
    response = requests.get(url)

    # Check if the request was successful (status code 200)
    if response.status_code == 200:
        # Parse the HTML content of the page
        soup = BeautifulSoup(response.text, 'html.parser')

        # Extracting the title
        title = soup.title.string
        print(f"Page Title: {title}")

        # Extracting the paragraphs
        paragraphs = soup.find_all('p')
        # Iterate through paragraphs and print their text
        for paragraph in paragraphs:
            print(paragraph.text.strip())

        # Extracting links in the "Contents" section using find with CSS selector
        contents_section = soup.find(class_='mw-content-ltr mw-parser-output')
        if contents_section:
            links_in_contents = contents_section.find_all('a', href=True)
            print("Links in Contents:")
            for link in links_in_contents:
                print(link['href'])

        selector = "#mw-content-text > div.mw-content-ltr.mw-parser-output > p:nth-child(6)"
        paragraph = soup.select_one(selector).text.strip()
        print(paragraph)

    else:
        print(f"Failed to fetch the page. Status code: {response.status_code}")
        return False

    return True

if __name__ == "__main__":
    # Replace this URL with the website you want to scrape
    target_url = "https://en.wikipedia.org/wiki/Python_(programming_language)"

    # Scrape the website
    result = scrape_website(target_url)

    # Print the results
    if result:
        print("Scraping Successeded")
    else:
        print("Scraping failed")