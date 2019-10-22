class Scraper
    attr_accessor :concern, :doc

    def initialize 
        @doc = Nokogiri::HTML(open("https://www.peachandlily.com/collections/skin-concern"))
    end 

    def scrape
        load_concerns
        scrape_concern_pages
    end

    def scrape_menu
        # @concern = SkinConcern.new("Acne")
        @concerns = @doc.search("li.main-nav__item:nth-child(3) a.sub-nav__link").collect do |concern|
            {
                name: concern.get_attribute('title'),
                url: concern.get_attribute('href')
            }
        end
        # @menu = @concerns.values_at(0,1,3,11)
        # binding.pry
    end 

    def load_concerns
        scrape_menu.map do |concern_hash|
            SkinConcern.new(concern_hash[:name],concern_hash[:url])
        end
    end

    # we could refactor this method to accept a url as an argument and return the summary
    def scrape_concern_pages
        # @web_pages = {}
        SkinConcern.all.each do |concern| 
            web_page = Nokogiri::HTML(open("https://www.peachandlily.com/#{concern.url}"))
            if concern.name == "DRYNESS" || concern.name == "OILINESS"
                concern.summary = web_page.search("#collection-description > span").text.strip
            else 
                concern.summary = web_page.search("#collection-description").text.strip
            end 
        end
        # @web_pages
    end
end