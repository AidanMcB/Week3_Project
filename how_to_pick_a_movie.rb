require_relative "./config/environment.rb"

def how_to_pick_a_movie()
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
        "Action",
        "Comedy",
        "Horror",
        "Romance",
        "Sci Fi",
        "Thriller"
    ])
    elsif movie_selection == "Title"
        title_selection_prompt = TTY::Prompt.new()

        title_selection = title_selection_prompt.select("Titles:", [
            Movie.movie_titles
        ])
    end 

end