class CLI

    attr_reader :generated_url, :selected_size, :list

    def welcome
        puts Rainbow(" _____               ______ _           _").cyan            
        puts Rainbow("|  __ \\\             |  ____(_)         | |").cyan     
        puts Rainbow("| |__) |   _ _ __   | |__   _ _ __   __| | ___ _ __").cyan
        puts Rainbow("|  ___/ | | | '_ \\\  |  __| | | '_ \\\ / _` |/ _ \\\ '__|").cyan
        puts Rainbow("| |   | |_| | |_) | | |    | | | | | (_| |  __/ |").cyan    
        puts Rainbow("|_|    \\\__,_| .__/  |_|    |_|_| |_|\\\__,_|\\\___|_|").cyan  
        puts Rainbow("            | |                                  ").cyan    
        puts Rainbow("            |_|                                  ").cyan
        puts Rainbow("\nWelcome to PupFinder!").bright
        
        call
    end

    def call
        what_size
            if get_size != "exit"
                please_wait
                scrape_pages
                get_info
            end
    end

    def get_info
        @list = list_breeds
        enter_a_number
        number_to_see = get_number(list)
        
        if number_to_see == "exit"
            puts Rainbow("\n\nGoodbye!").cyan
        else
            breed_to_scrape = list[number_to_see - 1]
            exists = Breed.all.select {|breed_object| breed_object.breed_name == breed_to_scrape}
            
            if !exists[0].weight
                AKCScraper.make_breed(number_to_see, list)
            end
            
        more_info(number_to_see)
        continue_message
        options
        end
    end

    def what_size
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
        elsif input == "exit"
            puts Rainbow("Goodbye!").cyan
            return "exit"
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

    # Returns an array of all breed objects (with just name, size and link attributes) that match size
    def find_all_breeds_by_size(size)
        Breed.all.select {|breed_object| breed_object.breed_size == size}
    end


    # Returns a numbered list of all breeds by the selected size
    def list_breeds
        find_all_breeds_by_size(selected_size).map.with_index do |breed, index|
            puts Rainbow("#{index + 1}. #{breed.breed_name}").cyan
            breed.breed_name
        end
    end

    def enter_a_number
        puts "\n\nEnter a number to see more information about that pup \n\n"
    end

    def get_number(list)
        range_to_select_from = (1..list.length).to_a
        number_entered = gets.strip
            if number_entered != "exit"
                number_entered = number_entered.to_i
                loop do
                    if !range_to_select_from.include?(number_entered)
                        puts "Please enter a number between #{range_to_select_from[0]} and #{range_to_select_from[-1]}"
                        return get_number(list)
                    else
                        return number_entered
                    end
                end
            else
                return "exit"
            end
    end

    def more_info(number_entered)
        breed_to_see = @list[number_entered - 1]
        Breed.all.each do |breed|
            if breed.breed_name == breed_to_see
                puts Rainbow("\nThe #{breed.breed_name}\n").bold
                puts Rainbow("      __\n(___()'`;\n/,    /`\n\\\\'--\\\\\n\n").cyan.bright
                puts Rainbow("Temperament: ").bold + Rainbow("#{breed.temperament}\n").cyan
                puts Rainbow("Weight: ").bold + Rainbow("#{breed.weight}\n").cyan
                puts Rainbow("Life Expectancy: ").bold + Rainbow("#{breed.life_expectancy}\n").cyan
                puts Rainbow("Description: ").bold + Rainbow("#{breed.description}\n").cyan
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
                puts Rainbow("\nGoodbye!").cyan
            when "exit"
                puts Rainbow("\nGoodbye!").cyan
            else
                puts "Please try again"
                options
        end
    end


end

