class SkincareCliGem::CLI
    
    def call
        puts "Welcome to your skincare curations."
        puts "-"*40
        list_skin_concerns
        menu
        goodbye
    end

    def list_skin_concerns
        #here doc
        puts <<~DOC 
            1. Acne
            2. Anti-aging
            3. Dryness
            4. Sensitive Skin
        DOC
    end

    def menu 
        
        input = nil
        while input != "exit"
            puts "Please type the corresponding number to your skin concern, type list for the options, or type exit to leave:"
            input = gets.strip.downcase
            case input 
            when "1"
                puts "info on acne"
            when "2"
                puts "info on antiaging"
            when "3"
                puts "info on dryness"
            when "4"
                puts "info on sensitive skin"
            when "list"
                list_skin_concerns
            end
        end
    end 

    def goodbye
        puts "Thanks for visiting! See you next time!"
    end 

end