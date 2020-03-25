require_relative "./config/environment.rb"
def welcome_user()


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

end

