class URLGenerator
    
    def self.new_url(user_input)
        base_url = "https://www.akc.org/dog-breeds/"
        input = user_input
        case input
        when "tiny"
            input = "xsmall"
            new_url = base_url << "?size=#{input}"
        when "small"
            new_url = base_url << "?size=#{input}"

        when "medium"
            new_url = base_url << "?size=#{input}"
           
        when "large"
            new_url = base_url << "?size=#{input}"
            
        when "huge"
            input = "xlarge"
            new_url = base_url << "?size=#{input}"
        end
        return new_url
    end



end
