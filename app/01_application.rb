class Application < ActiveRecord::Base

        @@viewer = nil
        @@movie_choice = nil

def self.welcome_user
#welcomes a user
#if their name already exists as a user, they are brought to the next method
#if they are a new user, they enter their email and payment option and are 
#created as a new user 
    puts "Welcome to Melike’s Movie Mania!"

    puts "Please enter your name:"
    input_name = gets.strip

    if (Viewer.find_viewer(input_name))
        @@viewer = Viewer.find_viewer(input_name)
    else 
        puts "Please enter your email address:"
        input_email = gets.strip

        payment_prompt = TTY::Prompt.new()
        payment = payment_prompt.select("What is your payment option?",[
            "Visa",
            "Mastercard",
            "American Express"
    ])
        @@viewer = Viewer.create({name: input_name, email_address: input_email,payment_option: payment})
    end

end


def self.how_to_pick_a_movie
        #determines how a user would like to viewe their movie options
    #saves their selected movie in a class variable allowing it to be used later
    
    puts "Welcome #{@@viewer.name}! How would you like to select a movie?"

    movie_selection_prompt = TTY::Prompt.new()

movie_selection = movie_selection_prompt.select("List movies by:",[
    "Genre",
    "Title",
    "Rating",
    "Runtime",
    "Location"
])
    if movie_selection == "Genre"
    genre_selection_prompt = TTY::Prompt.new()

    genre_selection = genre_selection_prompt.select("Genres:", [
            Movie.genres
        ])
       genre_array = Movie.all.select {|movie| movie.genre == genre_selection}
      #adds a secondary prompt to select a movie of that specific genre 
      movie_genres_prompt = TTY::Prompt.new()
      genre = movie_genres_prompt.select("Pick a movie from the #{genre_selection} genre:", [
            genre_array.map {|movie| movie.title}])

            @@movie_choice = genre
        
    elsif movie_selection == "Title"
        title_selection_prompt = TTY::Prompt.new()

        title_selection = title_selection_prompt.select("Titles:", [
            Movie.titles
        ])
        @@movie_choice = title_selection

    elsif movie_selection == "Location"
        location_selection_prompt = TTY::Prompt.new()
               
        location_selection = location_selection_prompt.select("Locations:", [
            Movie.locations.uniq
        ])
       location_array_tickets = Ticket.all.select {|ticket| ticket.location == location_selection}
       location_array_movies = location_array_tickets.map {|ticket| ticket.movie}
        #adds a secondary prompt to select movies available to see at that location
            movie_locations_prompt = TTY::Prompt.new()
            location = movie_locations_prompt.select("Movies at #{location_selection}:", [
                location_array_movies.map {|movie| movie.title}
            ])

            @@movie_choice = location
        
    elsif movie_selection == "Runtime" 
        puts "Enter a minimum runtime for your movie(in minutes):"
            min_time = gets.chomp
        puts "Enter a maximum runtime for your movie(in minutes):"
            max_time = gets.chomp
            runtime_selection_prompt = TTY::Prompt.new()
            
            runtime_selection = runtime_selection_prompt.select("Runtimes:", [
                Movie.runtimes(min_time.to_f, max_time.to_f)
            ])
            @@movie_choice = runtime_selection
            
    elsif movie_selection == "Rating" 
            puts "Enter a minimum rrating for your movie(0.1-10.0):"
                min_rate = gets.chomp
            puts "Enter a maximum rating for your movie(0.1-10.0):"
                max_rate = gets.chomp
                rating_selection_prompt = TTY::Prompt.new()
                
            rating_selection = rating_selection_prompt.select("Ratings:", [
                Movie.ratings(min_rate.to_f, max_rate.to_f)
            ])
            @@movie_choice = rating_selection

        end
    end

    def self.call_current_viewer
        @@viewer 
    end

    def self.call_movie_choice
        @@movie_choice
    end
    
end

 

