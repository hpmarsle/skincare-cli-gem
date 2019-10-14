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
        @products.each do |product|
            puts "#{product.name}  -  #{product.brand}  -  #{product.price}"
        end
    end 

    def add_product(name,brand,price)
        product = Product.new(name,brand,price)
        product.concern = self 
        @products << product
    end

end