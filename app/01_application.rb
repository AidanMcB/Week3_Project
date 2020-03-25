class Application < ActiveRecord::Base

    @@viewer = {}

def self.welcome_user

    puts "Welcome to Melike’s Movie Mania!"

    puts "Please enter your name:"
    input_name = gets.strip

    if (Viewer.find_viewer(input_name))
        viewer = Viewer.find_viewer(input_name)
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

attr_accessor :viewer

def self.how_to_pick_a_movie()
    # viewer = Application.welcome_user.viewer
    
    puts "Welcome #{viewer.name}! How would you like to select a movie?"

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
            Movie.movie_genres
        ])
    elsif movie_selection == "Title"
        title_selection_prompt = TTY::Prompt.new()

        title_selection = title_selection_prompt.select("Titles:", [
            Movie.movie_titles
        ])
    elsif movie_selection == "Rating"
        rating_selection_prompt = TTY::Prompt.new()

        rating_selection = rating_selection_prompt.select("Ratings:", [

        ])
    # elsif movie_selection
    # end 
    end
end
end



end