# require "pry"
class SkinConcern
    attr_accessor :name, :summary, :products
    @@all = []

    def initialize(name)
        @name = name
        @@all << self 
        @products = []
    end

    def self.all
        @@all
    end
    
    def list_products
        
    end 
    # def add_product(product)
    #   if !product.is_a?(Product)
    #     raise InvalidType, "must be an Article"
    #   else
    #     @articles << article
    #   end
    # end 
end