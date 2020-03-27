class PickAMovie < ActiveRecord::Base

    @@seat_info = nil
    @@total = 0
    


   def self.tickets
    current_movie = Application.call_current_movie
    viewer = Application.call_current_viewer
    purchase_selection = TTY::Prompt.new()
    purchase_prompt = purchase_selection.select("What would you like to do now?", ["Purchase a ticket", "Go back to the options", "See recommended movies"])

    if purchase_prompt == "Purchase a ticket"
        puts "How many seats would you like to purchase?"
        user_input = gets.strip
        @@seat_info = user_input.to_i



        showtime_selection = TTY::Prompt.new()
        showtime_prompt = showtime_selection.select("When would you like to see the show?",["7.00 PM", 
            "8.00 PM", 
            "9.00 PM", 
            "10.00 PM"
            ])
          
        age_selection = TTY::Prompt.new()
         age_prompt = age_selection.select("Which age group are you buying this ticket for?", ["adult", "child", "senior"])
            if age_prompt == "adult"
                @@total += @@seat_info * 13.00
            elsif age_prompt == "child"
                @@total += @@seat_info * 6.00
            elsif age_prompt == "senior"
                @@total += @@seat_info * 8.00
            end

            location_selection = TTY::Prompt.new()
            location_prompt = location_selection.select("Where would you like to see the movie?", [Movie.locations.uniq])
          
            
            ticket = Ticket.create({seats: @@seat_info, showtime: showtime_prompt, price: @@total, location: location_prompt, movie_id: current_movie.id, viewer_id: viewer.id})
    
            puts "Here is your ticket!"
            puts Hirb::Helpers::AutoTable.render(ticket)

        
    elsif purchase_prompt == "Go back to the options"
        movies_app

    elsif purchase_prompt == "See recommended movies"
        recommended_selection = TTY::Prompt.new()
        recommended_prompt = recommended_selection.select("Here are the movies we recommend for you:",[
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

   def self.movie_choice
    @@movie_choice
   end

   def self.get_total
    @@total
   end

end



