class Scraper
    attr_accessor :concern, :doc

    def initialize 
        @doc = Nokogiri::HTML(open("https://www.peachandlily.com/collections/skin-concern"))
    end 

    def scrape
        scrape_menu
        scrape_concern_pages
    end

    def scrape_menu
        # @concern = SkinConcern.new("Acne")
        @concerns = @doc.search("#filter-items > div:nth-child(2) > ul > li label").collect{|concern|concern.text.strip}
        @menu = @concerns.values_at(0,1,3,11)
        # binding.pry
        # @concern.summary = @doc.search("#logo-area > div:nth-child(2) > nav > ul > li:nth-child(3) > a")
        @menu
        @menu.each{|name|SkinConcern.new(name)}
    end 

    def scrape_concern_pages
        # @web_pages = {}
        SkinConcern.all.each do |concern| #@web_pages[concern.name] = 
            web_page = Nokogiri::HTML(open("https://www.peachandlily.com/collections/#{concern.name.downcase.gsub(" ", "-")}"))
            if concern.name == "Dryness"
                concern.summary = web_page.search("#collection-description > span").text.strip
            else 
                concern.summary = web_page.search("#collection-description").text.strip
            end 
        end
        # @web_pages
    end
end