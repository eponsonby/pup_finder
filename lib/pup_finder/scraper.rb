class AKCScraper
    
    # def self.scrape_breeds
    #     html = open("https://www.akc.org/dog-breeds/?size%5B%5D=xsmall")
    #     doc = Nokogiri::HTML(html)
    #     breeds = doc.css('.breed-card-type-grid .grid-col')
    #     binding.pry
    # end

    def self.get_page
        doc = Nokogiri::HTML(open("https://www.akc.org/dog-breeds/?size%5B%5D=xsmall"))
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

