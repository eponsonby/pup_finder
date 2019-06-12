class CLI

    attr_reader :generated_url, :selected_size, :breeds_list

    def call
        what_size
        get_size
        please_wait
        scrape_pages
        get_info
    end

    def get_info
        list = list_breeds
        enter_a_number
        number_to_see = get_number(list)
        AKCScraper.make_breed(number_to_see, list)
        more_info(number_to_see)
        continue_message
        options
    end

    def what_size
        
        puts "\u001b[36m _____               ______ _           _"            
        puts "|  __ \\\             |  ____(_)         | |"          
        puts "| |__) |   _ _ __   | |__   _ _ __   __| | ___ _ __"  
        puts "|  ___/ | | | '_ \\\  |  __| | | '_ \\\ / _` |/ _ \\\ '__|" 
        puts "| |   | |_| | |_) | | |    | | | | | (_| |  __/ |"    
        puts "|_|    \\\__,_| .__/  |_|    |_|_| |_|\\\__,_|\\\___|_|"  
        puts "            | |                                  "    
        puts "            |_|                                  \u001b[0m"   

        puts "\nWelcome to PupFinder!"
        puts "What size pupper are you interested in?"
        puts "You can say tiny, small, medium, large, or huge\n\n"
    end

    def get_size
        sizes_to_select_from = ["tiny", "small", "medium", "large", "huge"]
        input = gets.strip.downcase

        if input == "tiny"
            input = "xsmall"
        elsif input == "huge"
            input = "xlarge"
        elsif !sizes_to_select_from.include?(input)
            puts "Please try again"
            input = get_size
        end
        
        @selected_size = input
        return input
    end

    def please_wait
        puts "\nPlease wait while we load the pups!\n\n"
    end

    def generate_url(input)
        url_to_scrape = URLGenerator.new_url(input)  
    end
    
    def scrape_pages
        #this prevents the program from instantiating new breeds if they already exist
        if @generated_url == generate_url(selected_size)
        else
            @generated_url = generate_url(selected_size)
            AKCScraper.get_all_pages_of_breeds(generated_url)
        end
    end

    def find_all_breeds_by_size(size)
        Breed.all.select {|breed_object| breed_object.breed_size == size}
    end

    def list_breeds
        @breeds_list = []
 
        find_all_breeds_by_size(selected_size).each_with_index do |breed, index|
            @breeds_list << breed.breed_name
            puts "\u001b[36m#{index + 1}. #{breed.breed_name}\u001b[0m"
        end

        @breeds_list

    end

    def enter_a_number
        puts "\n\nEnter a number to see more information about that pup \n\n"
    end

    def get_number(list)
        range_to_select_from = (1..list.length).to_a
        number_entered = gets.to_i

        loop do 
            if !range_to_select_from.include?(number_entered)
                puts "Please enter a number between #{range_to_select_from[0]} and #{range_to_select_from[-1]}"
                number_entered = gets.to_i
            else
                return number_entered
            end
        end
    end

    def more_info(number_entered)
        breed_to_see = @breeds_list[number_entered - 1]
        
        Breed.all.each do |breed|
            if breed.breed_name == breed_to_see
                puts "\u001b[1m\nThe #{breed.breed_name}\n\u001b[0m"
                puts "\u001b[36;1m      __\n(___()'`;\n/,    /`\n\\\\'--\\\\\u001b[0m"
                puts "\u001b[1m\n\nTemperament: \u001b[0m" + "\u001b[36m#{breed.temperament}\n\u001b[0m"
                puts "\u001b[1mWeight: \u001b[0m" + "\u001b[36m#{breed.weight}\n\u001b[0m"
                puts "\u001b[1mLife Expectancy: \u001b[0m" + "\u001b[36m#{breed.life_expectancy}\n\u001b[0m"
                puts "\u001b[1mDescription: \u001b[0m" + "\u001b[36m#{breed.description}\n\u001b[0m"
            end
        end
    end


    def continue_message
        puts "\nWould you like to see another pup?"
        puts "You can enter yes, no, or menu to go back to the main menu"
        puts "Enter exit to end this program\n\n"
    end

    def continue_gets
        gets.strip.downcase
    end

    def options
        case continue_gets
            when "yes"
                puts "\n"
                get_info
            when "menu"
                puts "\n"
                call
            when "no"
                puts "\u001b[36m\nGoodbye!\u001b[0m"
            when "exit"
                puts "\u001b[36m\nGoodbye!\u001b[0m"
            else
                puts "Please try again"
                options
        end
    end


end

