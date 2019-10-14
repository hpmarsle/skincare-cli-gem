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
        @concerns = @doc.search("#filter-items > div:nth-child(2) > ul > li label").collect{|concern|concern.text.strip}
        @menu = @concerns.values_at(0,1,3,11)

        @menu.each{|name|SkinConcern.new(name)}
    end 

    def scrape_concern_pages
        
        SkinConcern.all.each do |concern| 
            web_page = Nokogiri::HTML(open("https://www.peachandlily.com/collections/#{concern.name.downcase.gsub(" ", "-")}"))
            @product_names = web_page.search("#collection-list > div > div > a.product-title")
            brand_names = web_page.search("#collection-list > div > div > a.product-vendor") #returns xml
            @brands = brand_names.collect{|n|n.text} #returns array of brands in readable text
            @prices = web_page.search("#collection-list > div > div > div.price").text.gsub(/\s+/," ").split(" ") #returns array of prices in readble format
            
            # How do i do mass assignment for multiple arrays to pass in each as a parameter for new object?
            # @product_names.each do |name|
            #     @brands.each do |brand_name|
            #         @prices.each do |price|
            #             concern.add_product(name.text,brand_name,price)
            #         end
            #     end
            # end
            if concern.name == "Dryness"
                concern.summary = web_page.search("#collection-description > span").text.strip
            else 
                concern.summary = web_page.search("#collection-description").text.strip
            end 
        end
        SkinConcern.all
    end

    # def scrape_products
    #     @product_names = web_page.search("#collection-list > div > div > a.product-title")
    #     @brands = web_page.search("#collection-list > div > div > a.product-vendor")
    #     @prices = web_page.search("#collection-list > div > div > div.price")
            
    #         @product_names.each do |name|
    #             product = concern.add_product(name.text)
    #         end 
    #         brands.each{|brand|brand.text}
    #         concern.products.each{|product|product.brand = }
    #         SkinConcern.all.each{|concern|concern.products }
    # end 
end