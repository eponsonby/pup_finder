class AKCScraper

    @@load_more_link = nil


    def self.get_first_page_breeds(size_url)
        #open first url based on user input
        doc = Nokogiri::HTML(open(size_url))

        # get all breeds on page 1
        first_page_breeds = doc.css('.breed-card-type-grid .grid-col')
        initial_breed_instantiation(first_page_breeds, size_url)
    
        # get load more link on page 1
        @@load_more_link = doc.css(".mt2 a").attribute("href").value
    end

    def self.get_all_pages_of_breeds(size_url)
        self.get_first_page_breeds(size_url)

        while @@load_more_link do
            # get all breeds on page 2
            next_page_doc = Nokogiri::HTML(open(@@load_more_link))
            next_page_breeds = next_page_doc.css('.breed-card-type-grid .grid-col')
            initial_breed_instantiation(next_page_breeds, size_url)
            
            # get load more link on page 2
            @@load_more_link = next_page_doc.css(".mt2 a").attribute("href")
        end    
    end
    
    def self.initial_breed_instantiation(page_of_breeds, size_url)
        page_of_breeds.each do |breed|
            breed_name = breed.css(".breed-type-card a h3").text
            breed_link = breed.css(".breed-type-card a").attribute('href').value
            breed_size = size_url.split("=")[1]
            Breed.new(breed_name, breed_link, breed_size)
        end
    end

    def self.make_breed(number, list)
        breed_to_scrape = list[number - 1]
        breed_object = Breed.all.select {|breed| breed.breed_name == breed_to_scrape}
            doc = Nokogiri::HTML(open(breed_object[0].breed_link))
            # get each li and set each attribute
            all_lis = doc.css(".panel-flex__aside ul li.attribute-list__row")
                all_lis.each do |li|
                    if li.css(".attribute-list__term").text == "Temperament:" 
                        breed_object[0].temperament = li.css(".attribute-list__description").text
                    elsif li.css(".attribute-list__term").text == "Weight:" 
                        breed_object[0].weight = li.css(".attribute-list__description").text
                    elsif li.css(".attribute-list__term").text == "Life Expectancy:"
                        breed_object[0].life_expectancy = li.css(".attribute-list__description").text.strip
                    end
                end
        
        #breed description
        if doc.css(".breed-hero__footer")
            breed_object[0].description = doc.css(".breed-hero__footer").text.strip
        else
            breed_object[0].description = "none available"
        end
    end
end

