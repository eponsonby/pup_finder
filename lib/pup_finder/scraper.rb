class AKCScraper
    @@all_breeds = []

    def get_breeds(url)
         # open first url based on user input
        doc = Nokogiri::HTML(open(url))

        # get all breeds on page 1
        first_page_breeds = doc.css('.breed-card-type-grid .grid-col')
        first_page_breeds.each do |breed|
            breed_name = breed.css(".breed-type-card a h3").text
            breed_link = breed.css(".breed-type-card a").attribute('href').value
            Breed.new(breed_name, breed_link)
        end
        # get load more link on page 1
        load_more_link = doc.css(".mt2 a").attribute("href")
        link_text = load_more_link.value
        
        while load_more_link != [] do
        # get all breeds on page 2
        next_page_html = Nokogiri::HTML(open(link_text))
        next_page_breeds = next_page_html.css('.breed-card-type-grid .grid-col')
        
        next_page_breeds.each do |breed|
            breed_name = breed.css(".breed-type-card a h3").text
            breed_link = breed.css(".breed-type-card a").attribute('href').value
            Breed.new(breed_name, breed_link)
        end

        # get load more link on page 2
        load_more_link = next_page_html.css(".mt2 a").attribute("href")
            if load_more_link
                link_text = load_more_link.value
            else
                load_more_link = []
            end
        end
        
    end
    

    def make_breeds
       Breed.all.each do |breed|
        doc = Nokogiri::HTML(open(breed.breed_link))
        # get each li and set each attribute
        all_lis = doc.css(".panel-flex__aside ul li.attribute-list__row")
            all_lis.each do |li|
                if li.css(".attribute-list__term").text == "Temperament:" 
                    breed.temperament = li.css(".attribute-list__description").text
                elsif li.css(".attribute-list__term").text == "Weight:" 
                    breed.weight = li.css(".attribute-list__description").text
                elsif li.css(".attribute-list__term").text == "Life Expectancy:"
                    breed.life_expectancy = li.css(".attribute-list__description").text.strip
                end
            end
        #breed description
        if doc.css(".breed-hero__footer")
            breed.description = doc.css(".breed-hero__footer").text.strip
        else
            breed.description = "none available"
        end
       end
    end
end

