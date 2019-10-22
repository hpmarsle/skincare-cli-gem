# require "pry"
class SkinConcern
    attr_accessor :name, :summary, :url #, :products
    @@all = []

    def initialize(name, url)
        @name = name
        @url = url
        @@all << self 
    #     # @products = []
    end

    def self.all
        @@all
    end
    # this would replace attr_accessor for summary
    # def summary 
    #     @summary ||= Scraper.new.scrape_summary(url)
    #     #@summary || @summary = Scraper.new.scrape_summary(url)
    # end
    
    # def add_product(product)
    #   if !product.is_a?(Product)
    #     raise InvalidType, "must be an Article"
    #   else
    #     @articles << article
    #   end
    # end 
end

a = 2 
a += 5
#=> a = a + 5
