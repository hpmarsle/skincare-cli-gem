class SkincareCliGem::CLI
    
    def call
        puts "Welcome to your skincare curations."
        puts "-"*40
        list_skin_concerns
        puts "Please select the corresponding number to your skin concern:"
        
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

end