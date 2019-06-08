class URLGenerator
    
    def self.new_url(user_input)
        base_url = "https://www.akc.org/dog-breeds/"
        input = user_input
        case input
        when "xsmall"
            new_url = base_url << "?size=#{input}"
        when "small"
            new_url = base_url << "?size=#{input}"

        when "medium"
            new_url = base_url << "?size=#{input}"
           
        when "large"
            new_url = base_url << "?size=#{input}"
            
        when "xlarge"
            new_url = base_url << "?size=#{input}"
        end
        return new_url
    end



end
