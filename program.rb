require_relative "./config/environment.rb"
ActiveRecord::Base.logger.level = 1 
# a = Artii::Base.new(:font => 'mini')
# puts a.asciify("Welcome to Melike’s Movie Mania!")
# def exit_method 
#     # b = Artii::Base.new(:font => 'stella')
#     # puts b.asciify
#     puts "We hope to see you again!"
# end
    
def slowly
    yield.each_char { |c| putc c; $stdout.flush; sleep 0.15 }
end
  

Application.welcome_user        #welcomes or creates a new user

def movies_app
    save_for_later = TicketStorage.call_save_for_later
    Application.how_to_pick_a_movie     #assigns value to @@movie_choice
    
    TicketStorage.save_to_array         #saves a movie to an array to watch later

    PickAMovie.tickets                  #assigns a ticket to the viewer

    if save_for_later != []
        TicketStorage.view_my_cart 
    end
    slowly do 
      "Thanks for choosing Melike's Movie Mania!".blue
    end

end

movies_app






