require_relative "./config/environment.rb"



Application.welcome_user        #welcoems or creates a new user
def movies_app
Application.how_to_pick_a_movie #assigns value to @@movie_choice

TicketStorage.save_to_array     #saves a movie to an array to watch later
PickAMovie.tickets              #assigns a ticket to the viewer
TicketStorage.view_my_cart 

#TicketStorage.close_app         #prints a thank you message
end


movies_app