class SkincareCliGem::SkinConcern
    attr_accessor

    def self.all
       #should return all skincare conccerns 
       puts <<~DOC 
            1. Acne
            2. Anti-aging
            3. Dryness
            4. Sensitive Skin
        DOC
    end
end