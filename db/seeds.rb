Movie.destroy_all
Viewer.destroy_all
Ticket.destroy_all
#ticket last

#rake db:seed every time this file is changed 


v1 = Viewer.create({name: "Mel", email_address: "mel@gmail.com",
    payment_option: "Mastercard"})

v2 = Viewer.create({name: "Aidan", email_address: "Aidan@gmail.com",
     payment_option: "Visa"})

m1 = Movie.create({title: "Star Wars", rating: 9.8, actors: "Harrison Ford, Adam Driver", 
    runtime: 2.5, genre: "Sci-fi"})


m2 = Movie.create({title: "Marriage Story", rating: 7.8, actors: "Adam Driver, Scarlette Johanson", 
        runtime: 2.0, genre: "Romance"})

t1 = Ticket.create({seats: 2, movie_id: m1.id, viewer_id: v2.id, showtime: "7:00pm", price: 12.00, location: "Melike's Movies"})
t2 = Ticket.create({seats: 2, movie_id: m2.id, viewer_id: v1.id, showtime: "8:00pm", price: 13.00, location: "The Alamo"})
t3 = Ticket.create({seats: 3, movie_id: m1.id, viewer_id: v1.id, showtime: "9:00pm", price: 13.00, location: "The Alamo"})