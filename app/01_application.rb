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



end