require_relative "./config/environment.rb"

# a = Artii::Base.new(:font => 'mini')
# puts a.asciify("Welcome to Melike’s Movie Mania!")
# def exit_method 
#     # b = Artii::Base.new(:font => 'stella')
#     # puts b.asciify
#     puts "We hope to see you again!"
# end
    


Application.welcome_user        #welcoems or creates a new user

def movies_app
    Application.how_to_pick_a_movie #assigns value to @@movie_choice

    TicketStorage.save_to_array     #saves a movie to an array to watch later
    PickAMovie.tickets              #assigns a ticket to the viewer
    TicketStorage.view_my_cart 

    puts "Thanks for choosing Melike's Movie Mania"
    #TicketStorage.close_app         #prints a thank you message
end

movies_app

