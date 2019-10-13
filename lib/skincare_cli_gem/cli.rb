class CLI
    
    def initialize
        puts "Welcome to your skincare collections."
        puts "-"*40
    
        s = Scraper.new
        @skin_concerns = s.scrape
    end 
    
    def call
        list_skin_concerns
        #  binding.pry
        menu
      
    end

    def list_skin_concerns
        puts "\nSkin Concern Menu"
        @skin_concerns.each.with_index(1){|concern, i|puts "#{i}. #{concern.name}"}
        #     1. Acne 
        #     2. Anti-aging
        #     3. Dryness
        #     4. Sensitive Skin
        
        # @concerns = SkinConcern.all
        
    end

    def menu 
        
        input = nil
        while input != "exit"
            puts "\nPlease type the corresponding number to your skin concern, type list for the options, or type exit to leave:"
            input = gets.strip.downcase
            
            if input.to_i > 0 && input.to_i <= 4
                puts @skin_concerns[input.to_i-1].name 
                puts @skin_concerns[input.to_i-1].summary 
                puts ""
                puts "Would you like to see a list of recommended products for this skin concern? (y/n)"
                see_products = nil
                while see_products != "y" || see_products != "n"
                    see_products = gets.strip.downcase
                    case see_products
                    when "y"
                        @skin_concerns[input.to_i-1].list_products
                        break
                    when "n"
                        puts "Okay, let us know if you change your mind."
                        break
                    else 
                        puts "Please enter yes or no.(y/n)"
                    end 
                end 

            elsif input == "list"
                list_skin_concerns
            elsif input == "exit"
                goodbye
            else 
                puts "Please enter a valid option"
            end
        end
    end 

    def goodbye
        puts "Thanks for visiting! See you next time!"
    end 
    

end