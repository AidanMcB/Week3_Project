class TicketStorage < ActiveRecord::Base

    #classs variables
    @@save_for_later = []   #call in method 
    # @@viewer = Application.call_current_viewer #must call in a method

    def self.view_my_cart #prompts the user to see if they want to view their saved movies
        view_cart_prompt = TTY::Prompt.new()
        cart_view = view_cart_prompt.select("Would you like to view the movies you saved for later?", [
            "Yes",
            "No"
        ])
        if cart_view == "Yes"
            puts @@save_for_later
        else 
        end
    end

    def self.save_to_array      #saves a movie to an array to watch later
        movie_choice = Application.call_movie_choice
    
        sfl_prompt = TTY::Prompt.new()
        sfl = sfl_prompt.select("Would you like to save this movie to consider later?", [
            "Yes",
            "No"
        ])
        if sfl == "Yes" 
            @@save_for_later.push(movie_choice)
        end 
    end

    def self.call_save_for_later
        @@save_for_later
    end



    def self.save_for_later
        @@save_for_later
    end

end