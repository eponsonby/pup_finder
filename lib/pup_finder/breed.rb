class Breed
    attr_accessor :breed_name, :temperament, :size, :weight, :life_expectancy, :description, :breed_link
    @@all = []

    def initialize(breed_name, breed_link)
        @breed_name = breed_name
        @breed_link = breed_link
        @@all << self
    end

    def self.all
        @@all
    end

    # def self.small
    #     # go to AKC breed + size page
    #         # use the URL generator to iterate through each size page
    #     # extract the data
    #     # instantiate a breed

    #     breed_1 = self.new
    #     breed_1.name = "Basenji"
    #     breed_1.temperament = "Independent, Smart, Poised"
    #     breed_1.size = 
    #     breed_1.weight = "24 pounds (male), 22 pounds (female)"
    #     breed_1.life_expectancy = "13-14 years"
    #     breed_1.description = "The Basenji, Africa’s “Barkless Dog,” is a compact, sweet-faced hunter of intelligence and poise. They are unique and beguiling pets, best for owners who can meet their exercise needs and the challenge of training this catlike canine."
    #     breed_1.url = "https://www.akc.org/dog-breeds/basenji/"

    #     breed_2 = self.new
    #     breed_2.name = "Beagle"
    #     breed_2.temperament = "Friendly, Curious, Merry"
    #     breed_1.size = 
    #     breed_2.weight = "under 20 pounds (13 inches & under), 20-30 pounds (13-15 inches)"
    #     breed_2.life_expectancy = "10-15 years"
    #     breed_2.description = "Not only is the Beagle an excellent hunting dog and loyal companion, it is also happy-go-lucky, funny, and—thanks to its pleading expression—cute. They were bred to hunt in packs, so they enjoy company and are generally easygoing"
    #     breed_2.url = 'https://www.akc.org/dog-breeds/beagle/'

    #     [breed_1, breed_2]

    # end

end