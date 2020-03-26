require_relative "./config/environment.rb"

Application.welcome_user        #welcoems or creates a new user
Application.how_to_pick_a_movie #assigns value to @@movie_choice
PickAMovie.tickets              #assigns a ticket to the viewer
TicketStorage.close_app         #prints a thank you message

#Deliverables.method

# movie__experiene