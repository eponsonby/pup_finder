#This is the CLI controller
require_relative 'breed'
require_relative 'scraper'

class CLI

    attr_accessor :generated_url, :user_input

    def call
        first_loop
        second_loop
    end

    def first_loop # please name this better
            welcome
            @user_input = get_input

            if @generated_url == generate_url(user_input)

            else
                @generated_url = generate_url(user_input)
                AKCScraper.get_breeds(@generated_url)
            end
    end

    def second_loop # please name this better
        list_breeds
        enter_a_number
        number_entered = get_number
        AKCScraper.make_breed(number_entered)
        more_info(number_entered)
        continue_message
        options
    end

    def end_program
        puts "Goodbye!"
    end

    def options
        yes_no_or_menu = continue_gets

        loop do
            case yes_no_or_menu
            when "yes"
                second_loop
            when "no"
                end_program
            when "menu"
                first_loop
                second_loop
            else
                puts "Please try again"
                yes_no_or_menu = continue_gets
            end

        break if "no"
        end
    end

    def welcome
        puts "Welcome to PupFinder"
        puts "What size pupper are you interested in?"
        puts "You can say tiny, small, medium, large or huge"
    end

    def get_input
        input = gets.strip.downcase
    end

    def generate_url(input)
        url_to_scrape = URLGenerator.new_url(input)  
    end
    
    def list_breeds
        #list only breeds of the size from user_input
        Breed.breed_hash.each do |key, value, index|
            puts "#{index + 1}. #{key}" if value == @user_input
        end
    end

    def enter_a_number
        puts "\n\nEnter a number to see more information about that pup \n\n"
    end

    def get_number
        number_entered = gets.to_i
        hash = Breed.breed_hash
        range_to_select_from = hash.collect do |key, value|
            key
        end
        
        if number_entered == 0 || number_entered < 0 || !range_to_select_from.include?(number_entered)
            loop do
                if number_entered == 0 || number_entered < 0
                    puts "Please try again"
                    number_entered = gets.to_i
                elsif 
                    !range_to_select_from.include?(number_entered)
                    puts "Please enter a number between #{range_to_select_from[0]} and #{range_to_select_from[-1]}"
                    number_entered = gets.to_i
                else
                    break
                end
            end
        elsif number_entered
        end

        number_entered
    end

    def more_info(number_entered)
        breed_to_see = Breed.breed_hash[number_entered]
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
        puts "You can enter yes or no"
        puts "Or, you can enter menu to go back to the main menu\n\n"
    end

    def continue_gets
        gets.strip.downcase
    end


end

