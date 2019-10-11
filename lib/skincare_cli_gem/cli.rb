class SkincareCliGem::CLI
    
    def initialize
      puts "Welcome to your skincare collections."
      puts "-"*40
      
      @concern = SkincareCliGem::Scraper.new
    end 
    
    def call

        list_skin_concerns
        menu
    end

    def list_skin_concerns
  
        puts <<~DOC 
            1. Acne #acne page 
            2. Anti-aging
            3. Dryness
            4. Sensitive Skin
        DOC
        @concerns = SkincareCliGem::SkinConcern.all
    end

    def menu 
        
        input = nil
        while input != "exit"
            puts "Please type the corresponding number to your skin concern, type list for the options, or type exit to leave:"
            input = gets.strip.downcase
            
            if input.to_i > 0 && input.to_i <= 4
                # SkincareCliGem::Scraper.new()
                puts @concerns[input.to_i-1]
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