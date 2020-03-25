class Application < ActiveRecord::Base

        @@viewer = nil
        @@movie_choice = nil

def self.welcome_user

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
        binding.pry
    end

end



    #determines how a user would like to viewe their movie options
    #saves their selected movie in a class variable allowing it to be used later

def self.how_to_pick_a_movie
    
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
    elsif movie_selection == "Title"
        title_selection_prompt = TTY::Prompt.new()

        title_selection = title_selection_prompt.select("Titles:", [
            Movie.titles
        ])
    elsif movie_selection == "Locations"
        location_selection_prompt = TTY::Prompt.new()

        location_selection = location_selection_prompt.select("Locations:", [
            Movie.locations
        ])
    elsif movie_selection == "Runtime" 
        puts "Enter a minimum runtime for your movie(in minutes):"
            min_time = gets.chomp
        puts "Enter a maximum runtime for your movie(in minutes):"
            max_time = gets.chomp
            runtime_selection_prompt = TTY::Prompt.new()
            
            runtime_selection = runtime_selection_prompt.select("Runtimes:", [
                Movie.runtimes(min_time.to_f, max_time.to_f)
            ])
    elsif movie_selection == "Rating" 
            puts "Enter a minimum rrating for your movie(0.1-10.0):"
                min_rate = gets.chomp
            puts "Enter a maximum rating for your movie(0.1-10.0):"
                max_rate = gets.chomp
                rating_selection_prompt = TTY::Prompt.new()
                
            rating_selection = rating_selection_prompt.select("Ratings:", [
                Movie.ratings(min_rate.to_f, max_rate.to_f)
            ])
        
    
        end
    end

    def self.call_current_viewer
        @@viewer 
    end

    def self.call_movie_choice
        @@movie_choice
    end
    
end

 

