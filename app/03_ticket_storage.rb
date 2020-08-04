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
        if cart_view === "Yes"
            system "clear" 
            puts "You've considered these titles:"
            puts @@save_for_later
            exit_prompt = TTY::Prompt.new()
            exit_prompt_selection = exit_prompt.select("Continue browsing movies?", [
                "Yes, show me more flicks!",
                  "No, I'm done"
            ])
            system "clear" 
            if exit_prompt_selection == "Yes, show me more flicks!"
                movies_app
            end
        elsif cart_view == "No"
            movies_app
        end
    end

    def self.save_to_array      #saves a movie to an array to watch later
        movie_choice = Application.call_movie_choice
    # binding.pry
        sfl_prompt = TTY::Prompt.new()
        sfl = sfl_prompt.select("Would you like to save this movie to consider later?", [
            "Yes",
            "No"
        ])
        if sfl == "Yes" 
            @@save_for_later.push(movie_choice).uniq
        else
            nil
        end 
    end

  
    def self.call_save_for_later
        @@save_for_later
    end


end