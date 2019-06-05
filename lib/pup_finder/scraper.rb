require 'nokogiri'
require 'open-uri'
require 'pry'

class PupFinder::Scraper
    def get_page
        doc = Nokogiri::HTML(open("https://www.akc.org/dog-breeds/?size%5B%5D=xsmall"))
        binding.pry
    end

    # def get_breeds
    #     self.get_page.css("")

    # end

    # def make_breeds
    #     self.get_breeds.each do |block|
    #         breed = Breed.new
    #         breed.name = 
    #         breed.temperament =
    #         breed.size =
    #         breed.weight =
    #         breed.life_expectancy =
    #         breed.description =
    #         breed.url =
    # end
end