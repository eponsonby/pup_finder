class Breed
    attr_accessor :temperament, :weight, :life_expectancy, :description
    attr_reader :breed_name, :breed_link, :breed_size
    
    @@all = []

    def initialize(breed_name, breed_link, breed_size)
        @breed_name = breed_name
        @breed_link = breed_link
        @breed_size = breed_size
        @temperament = nil
        @weight = nil
        @life_expectancy = nil
        @description = nil
        @@all << self
    end

    def self.all
        @@all
    end
end


