import scrapy


class WebSpider(scrapy.Spider):
    name = "web"
    allowed_domains = ["en.wikipedia.org"]
    start_urls = ["https://en.wikipedia.org/wiki/Python_(programming_language)"]
        

    def parse(self, response):
        title = response.css('title').get()

        content = response.css('div#mw-content-text > div.mw-content-ltr.mw-parser-output > p:nth-child(6)').get()

        # Display the extracted data
        self.log(f'Title: {title}')
        self.log(f'Content: {content}')

        yield {
            'title2': title,
            'content2': content,
        }