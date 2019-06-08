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

    def self.breed_hash
        breed_hash = {}
        self.all.each_with_index do |breed|
            breed_hash[breed.breed_name] = breed.breed_size
        end

        breed_hash
    end
 

end