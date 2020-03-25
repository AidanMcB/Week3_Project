require_relative "./config/environment.rb"
<<<<<<< HEAD

def how_to_pick_a_movie()
=======
require_relative "./welcome_user.rb"


def how_to_pick_a_movie()
    viewer = Application.welcome_user.viewer
    
    puts "Welcome #{viewer.name}! How would you like to select a movie?"

>>>>>>> Aidan
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
<<<<<<< HEAD
        "Action",
        "Comedy",
        "Horror",
        "Romance",
        "Sci Fi",
        "Thriller"
    ])
=======
            Movie.movie_genres
        ])
>>>>>>> Aidan
    elsif movie_selection == "Title"
        title_selection_prompt = TTY::Prompt.new()

        title_selection = title_selection_prompt.select("Titles:", [
            Movie.movie_titles
        ])
<<<<<<< HEAD
    end 

end
=======
    elsif movie_selection == "Rating"
        rating_selection_prompt = TTY::Prompt.new()

        rating_selection = rating_selection_prompt.select("Ratings:", [

        ])
    # elsif movie_selection
    # end 
    end
end
>>>>>>> Aidan
