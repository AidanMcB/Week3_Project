class TicketStorage < ActiveRecord::Base

    #classs variables
    @@save_for_later = []   #call in method 
    @@viewer = Application.call_current_viewer #must call in a method

    # def self.close_app
    #     movie_choice = Application.call_movie_choice
    #     puts "Thank you for purchasing tickets to #{movie_choice}!"
    # end
    


    def self.save_for_later
        @@save_for_later
    end

end