class AKCScraper
    @@all_breeds = []

    def self.get_breeds(url)
        
         # open first url based on user input
        doc = Nokogiri::HTML(open(url))

        # get all breeds on page 1
        @@all_breeds << first_page = doc.css('.breed-card-type-grid .grid-col')

        # get load more link on page 1
        load_more_link = doc.css(".mt2 a").attribute("href")
        link_text = load_more_link.value
        
        while load_more_link != []
            link_text
        # get all breeds on page 2
        next_page_html = Nokogiri::HTML(open(link_text))
        @@all_breeds << next_page_breeds = next_page_html.css('.breed-card-type-grid .grid-col')
        # get load more link on page 2
        load_more_link = next_page_html.css(".mt2 a").attribute("href")
            if load_more_link
                link_text = load_more_link .value
            else
                load_more_link = []
            end
        end
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

