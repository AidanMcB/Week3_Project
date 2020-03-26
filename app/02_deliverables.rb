class PickAMovie < ActiveRecord::Base

    @@movie_choice = Application.call_movie_choice
    #classs varioable
    @@viewer = Application.call_current_viewer


   def self.tickets
    purchase_selection = TTY::Prompt.new()
    purchase_prompt = purchase_selection.select("What would you like to do now?", ["Purchase a ticket", "Go back to the options", "See recommended movies"])

    if purchase_prompt == "Purchase a ticket"
        puts "How many tickets would you like to purchase?"
        user_input = gets.strip
        num_tickets = user_input.to_i


        puts "When would you like to see the show?"
        show_time = gets.strip

        age_selection = TTY::Prompt.new()
        age_prompt = age_selection.select("Which age group are you buying this for", ["adult", "child", "senior"])
            if age_selection == "adult"
                total = num_tickets * 13.00
            elsif age_selection == "child"
                total = num_tickets * 6.00
            elsif age_selection == "senior"
                total = num_tickets * 8.00
            end

            location_selection = TTY::Prompt.new()
            location_prompt = location_selection.select("Where would you like to see the movie?", ["Main St", "Capitol", "Sugarland"])
            
        
        #ik i am passing a local variable below
        puts " Thank you for your purchase, #{viewer.name}! Enjoy your movie"
    
        
    elsif purchase_prompt == "Go back to the options"
        #line below
        Application.how_to_pick_a_movie()

    elsif purchase_prompt == "See recommended movies"
        recommended_selection = TTY::Prompt.new()
        recommended_prompt = recommended_selection.select("Here are the movies we recommend for you",[
            "Ad Astra",
            "Midsommar",
            "Knives Out",
            "Once Upon A Time in Hollywood",
            "Parasite",
            "Little Women",
            "Joker"
            
        ]) 
    end
   end
end



