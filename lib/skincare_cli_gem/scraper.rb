class SkincareCliGem::Scraper
    attr_accessor :concern, :doc

    def initialize(name)
        @concern = SkincareCliGem::SkinConcern.new(name)
        @doc = Nokogiri::HTML(open("https://www.peachandlily.com/collections/#{name}"))
    end 
    
    def scrape_summary
      @concern.summary = @doc.search("#logo-area > div:nth-child(2) > nav > ul > li:nth-child(3) > a")
    end 

end 