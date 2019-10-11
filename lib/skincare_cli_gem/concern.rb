require "pry"
class SkincareCliGem::SkinConcern
    attr_accessor :name, :summary, :products, :url
    @@all = []

    def initialize(name)
        @name = name
        @@all << self 
        @products = []
    end

    def self.all
        @@all
    end
end