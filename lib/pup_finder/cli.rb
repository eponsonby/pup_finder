#This is the CLI controller
require_relative 'breed'
require_relative 'scraper'

class CLI

    def call
        welcome
        user_input = get_input
        selected_size = generate_url(user_input).join
        breed_scraper = AKCScraper.new
        breed_scraper.get_breeds(selected_size)
        breed_scraper.make_breeds
        loop do 
            intermediate_message
            list_breeds
            enter_a_number
            number_entered = get_number
            more_info(number_entered)
            continue_message
            yes_or_no = continue_gets
                if yes_or_no == "yes"
                    
                elsif yes_or_no != "yes" && yes_or_no != "no"
                    loop do
                        if yes_or_no != "yes" && yes_or_no != "no"
                            puts "Please try again"
                            yes_or_no = continue_gets
                        else 
                            break
                        end
                    end
                elsif yes_or_no == "yes"

                elsif yes_or_no == "no"
                    puts "\n\nGoodbye!"
                break
                end
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

    def intermediate_message
        puts "There are #{Breed.all.length} breeds in this list"
    end

    def breed_hash
        breed_hash = {}
        Breed.all.each_with_index do |breed, index|
            breed_hash[index + 1] = breed.breed_name
        end
        breed_hash
    end
    
    def list_breeds
        puts "Here are the first 10 breeds. Enter next to see more"
        breed_hash.each do |key, value|
            puts "#{key}. #{value}"
        end
    end

    def enter_a_number
        puts "\n\nEnter a number to see more information about that pup \n\n"
    end

    def get_number
        number = gets.to_i
            if number == 0
                puts "Please try again"
            elsif number 
                # elsif yes_or_no != "yes" && yes_or_no != "no"
                #     loop do
                #         if yes_or_no != "yes" && yes_or_no != "no"
                #             puts "Please try again"
                #             yes_or_no = continue_gets
                #         else 
                #             break
                #         end
                #     end
                # elsif yes_or_no == "yes"

                # elsif yes_or_no == "no"
                #     puts "\n\nGoodbye!"
                # break
                # end
    end

    def more_info(number_entered)
        #if the user enters 4
        # list more info about dog 4 name, weight, life ex, description
        breed_to_see = breed_hash[number_entered]
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
        yes_or_no = gets.strip.downcase
    end

    def run_again(yes_or_no)
        if yes_or_no == "yes"
            list_breeds
            enter_a_number
            entered = get_number
            more_info(entered)
            continue_message
        else
            puts "Hope you found a pup!"
        end
    end


end

