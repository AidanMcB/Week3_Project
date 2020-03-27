class Application < ActiveRecord::Base

        @@viewer = nil
        @@movie_choice = nil
        @@current_movie = nil

def self.welcome_user
#welcomes a user
#if their name already exists as a user, they are brought to the next method
#if they are a new user, they enter their email and payment option and are 
#created as a new user 
    a = Artii::Base.new(:font => 'slant')
    puts a.asciify("Welcome to Melike’s Movie Mania!")

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
    
    puts "How would you like to select a movie?"

    movie_selection_prompt = TTY::Prompt.new()

movie_selection = movie_selection_prompt.select("List movies by:",[
    "Genre",
    "Title",
    "Rating",
    "Runtime",
    "Location"
])
    # binding.pry
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
            @@current_movie = Movie.all.find_by({title: @@movie_choice })
            binding.pry
    elsif movie_selection == "Title"
        title_selection_prompt = TTY::Prompt.new()

        title_selection = title_selection_prompt.select("Titles:", [
            Movie.titles
        ])
        @@movie_choice = title_selection
        @@current_movie = Movie.all.find_by({title: @@movie_choice })
        
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
            @@current_movie = Movie.all.find_by({title: @@movie_choice })
        
    elsif movie_selection == "Runtime" 
        
            runtime_selection_prompt = TTY::Prompt.new()
            
            runtime_selection = runtime_selection_prompt.select("Runtimes:", [
                Movie.runtimes
            ])
            @@movie_choice = runtime_selection
            @@current_movie = Movie.all.find_by({title: @@movie_choice })
            
    elsif movie_selection == "Rating" 
        loop do #loops through the ratings prompt until the input matches the prompt
            puts "Enter a minimum rating for your movie(5.0-10.0):"
                min_rate = gets.chomp
            puts "Enter a maximum rating for your movie(5.0-10.0):"
                max_rate = gets.chomp
    
                #restrict the input to 5.0 - 10.0
                if min_rate.to_f < 5.0 || max_rate.to_f > 10.0
                    puts "Please enter a valid rating"
                    # rating_selection_prompt = TTY::Prompt.new()
                
                    #  rating_selection = rating_selection_prompt.select("Ratings:", [
                    #  Movie.ratings(min_rate.to_f, max_rate.to_f)
                    # ])  
            
                elsif Movie.ratings(min_rate.to_f, max_rate.to_f) == []
                    puts "No movies are out within that rating range, please try another range"
                   
                else 
                    rating_selection_prompt = TTY::Prompt.new()
                
                    rating_selection = rating_selection_prompt.select("Ratings:", [
                    Movie.ratings(min_rate.to_f, max_rate.to_f)
                   ])  
                    break
                    @@movie_choice = rating_selection
                    @@current_movie = Movie.all.find_by({title: @@movie_choice })
                end
            end
                         
               
        end
        
    end
   
    def self.call_current_viewer
        @@viewer 
    end

    def self.call_movie_choice
        @@movie_choice
    end

    def self.call_current_movie
        @@current_movie
    end
    
end



