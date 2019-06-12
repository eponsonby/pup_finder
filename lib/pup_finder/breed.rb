class Breed
    attr_accessor :breed_name, :temperament, :size, :weight, :life_expectancy, :description, :breed_link, :breed_size
    
    @@all = []

    def initialize(breed_name, breed_link, breed_size)
        @breed_name = breed_name
        @breed_link = breed_link
        @breed_size = breed_size
        @@all << self
    end

    def self.all
        @@all
    end
 
end