class URLGenerator
    @@all = []

    
    def self.new_url(user_input)
        base_url = "https://www.akc.org/dog-breeds/"
        input = user_input
        case input
        when "tiny"
            input = "xsmall"
            new_url = base_url << "?size=#{input}"
            @@all << new_url
        when "small"
            new_url = base_url << "?size=#{input}"
            @@all << new_url
        when "medium"
            new_url = base_url << "?size=#{input}"
            @@all << new_url
        when "large"
            new_url = base_url << "?size=#{input}"
            @@all << new_url
        when "huge"
            input = "xlarge"
            new_url = base_url << "?size=#{input}"
            @@all << new_url
        end
        
    end


    def self.all
        @@all
    end

end
