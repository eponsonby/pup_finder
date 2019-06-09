
require_relative 'breed'
require_relative 'scraper'

class CLI

    attr_accessor :generated_url, :selected_size, :array_of_breeds

    def call
        what_size
        select_a_size
        please_wait
        scrape_pages
        get_info
    end

    def select_a_size
        @selected_size = get_size
    end

    def scrape_pages

        if @generated_url == generate_url(selected_size)

        else
            @generated_url = generate_url(selected_size)
            AKCScraper.get_breeds(generated_url)
            AKCScraper.get_additional_pages(generated_url)
        end
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

    def end_program
        puts "Goodbye!"
    end

    def options
            case continue_gets
            when "yes"
                get_info
            when "menu"
                call
            when "no"
                end_program
            when "exit"
                end_program
            else
                puts "Please try again"
                options
            end
    end

    def what_size
        puts "Welcome to PupFinder"
        puts "What size pupper are you interested in?"
        puts "You can say tiny, small, medium, large or huge\n\n"
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
        input
    end


    def generate_url(input)
        url_to_scrape = URLGenerator.new_url(input)  
    end
    
    def list_breeds
        @array_of_breeds = []
        Breed.breed_hash.each do |key, value|
            @array_of_breeds << key if value == @selected_size
        end

        @array_of_breeds.each_with_index do |breed, index|
            puts "#{index + 1}. #{breed}"
        end
    end

    def please_wait
        puts "\nPlease wait while we load the pups!\n"
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
            number_entered = gets.to.i
            else
                return number_entered
            end
        end
    end

    def more_info(number_entered)
        breed_to_see = @array_of_breeds[number_entered - 1]
        Breed.all.each do |breed|
            if breed.breed_name == breed_to_see
                puts "\nThe #{breed.breed_name}\n\n"
                puts "      __\n(___()'`;\n/,    /`\n\\\\'--\\\\"
                puts "\nTemperament: #{breed.temperament}\n\n"
                puts "Weight: #{breed.weight}\n\n"
                puts "Life Expectancy: #{breed.life_expectancy}\n\n"
                puts "Description: #{breed.description}"
            end
        end
    end

    def continue_message
        puts "\nWould you like to see another pup?"
        puts "You can enter yes, no, or menu to go back to the main menu\n\n"
        puts "Enter exit to end this program"
    end

    def continue_gets
        gets.strip.downcase
    end


end

