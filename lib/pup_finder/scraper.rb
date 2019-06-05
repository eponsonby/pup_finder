class AKCScraper

    def self.get_breeds(url)
        doc = Nokogiri::HTML(open(url))
        doc.css('.breed-card-type-grid .grid-col')
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

