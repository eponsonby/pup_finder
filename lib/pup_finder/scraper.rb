class AKCScraper

    def self.get_page(url)
        doc = Nokogiri::HTML(open(url))
    end

    def self.get_breeds
        value = self.get_page.css('.breed-card-type-grid .grid-col')
        binding.pry
    end
    
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

