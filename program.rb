require_relative "./config/environment.rb"
puts v1.name
puts "Welcome to Melike’s Movie Mania!"
puts "Please enter your name"
input_name = gets.strip
puts "Please enter your email_address"
input_email = gets.strip
prompt = TTY::Prompt.new()
payment = prompt.select("What is your payment option?",[
    "Visa",
    "Mastercard",
    "American Express"
])




