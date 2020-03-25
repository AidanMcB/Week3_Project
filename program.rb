require_relative "./config/environment.rb"
# puts v1.name
puts "Welcome to Melike’s Movie Mania!"
puts "Please enter your name"

input_name = gets.strip

puts "Please enter your email address"

input_email = gets.strip
payment_prompt = TTY::Prompt.new()

payment = payment_prompt.select("What is your payment option?",[
    "Visa",
    "Mastercard",
    "American Express"
])

viewer = Viewer.create({name: input_name,email_address: input_email,payment_option: payment})
#we are getting the arrays that include the column names as if they are attributes. When we print a particular column of this viewer, we get that attribute, but before that we get the array first.
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

