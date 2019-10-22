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
            
            if input.to_i > 0 && input.to_i <= 14
                puts @skin_concerns[input.to_i-1].name 
                puts @skin_concerns[input.to_i-1].summary 
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