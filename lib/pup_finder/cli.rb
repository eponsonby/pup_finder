#This is the CLI controller
require_relative 'breed'
require_relative 'scraper'

class CLI

    def call
        welcome
        user_input = get_input
        selected_size = generate_url(user_input).join
        AKCScraper.get_breeds(selected_size)
        # men
        # list_small_breeds
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


    # def menu
    #     input = gets.chomp.downcase
    #         case input
    #         when "small"
    #             #access the length of the list of dogs that are small
    #             puts "There are length dogs in this list"
    #             puts "Enter a letter from a-z to see all breeds by that letter"
    #             letter = gets.chomp.downcase
    #             # user will enter in a letter
    #             # check to see if that letter is included in an array of all letters from a to z
    #             # need to return a numbered list of all dogs that start with letter
    #             # access all dog instances, access their breed names, access only those that start with letter 
    #                 puts "Enter a number to see more info about that dog"
    #                 puts "list of numbered a dogs"
    #         when "medium"
    #             puts "There are number dogs in this list"
    #             puts "Enter a letter from a-z to see all breeds by that letter"
    #             letter = gets.chomp.downcase
    #         when "large"
    #             puts "There are number dogs in this list"
    #             puts "Enter a letter from a-z to see all breeds by that letter"
    #             letter = gets.chomp.downcase
    #         when "huge"
    #             puts "There are number dogs in this list"
    #             puts "Enter a letter from a-z to see all breeds by that letter"
    #             letter = gets.chomp.downcase
    #         end
    # end

    # def list_small_breeds
    #     @small_breeds = PupFinder::Breed.small
    #     puts @small_breeds
    # end

end

