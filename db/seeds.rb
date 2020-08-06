Movie.destroy_all
Viewer.destroy_all
Ticket.destroy_all
#ticket last
#run to reset
#rake db:seed every time this file is changed 

v1 = Viewer.create({name: "Mel", email_address: "mel@gmail.com",
    payment_option: "Mastercard"})
v2 = Viewer.create({name: "Aidan", email_address: "Aidan@gmail.com",
     payment_option: "Visa"}) 

m1 = Movie.create({title: "Star Wars", rating: 6.8, actors: "Harrison Ford, Adam Driver", 
    runtime: 142, genre: "Sci-fi"})
m2 = Movie.create({title: "Marriage Story", rating: 8.0 , actors: "Adam Driver, Scarlette Johanson", 
    runtime: 120, genre: "Romance"})
m3 = Movie.create({title: "The Farewell", rating: 7.6, actors: " Shuzhen Zhao, Awkwafina", 
    runtime: 100, genre: "Comedy"})
m4 = Movie.create({title: "The Lighthouse", rating: 7.7, actors: "Robert Pattinson, Willem Dafoe, Valeriia Karaman", 
    runtime: 120, genre: "Horror"})
m5 = Movie.create({title: "Pain and Glory", rating: 7.6, actors: "Antonio Banderas, Asier Etxendia", 
    runtime: 117, genre: "Drama"})
m6 = Movie.create({title: "Ford v Ferrari", rating: 8.1, actors: "Matt Damon, Christian Bale, Jon Bernthal", 
     runtime: 152, genre: "Action"})
m7 = Movie.create({title: "Toy Story 4", rating: 7.8, actors: "Tom Hanks, Tim Allen, Annie Potts", 
    runtime: 100, genre: "Animation"})

t1 = Ticket.create({seats: 2, movie_name: m1.title, movie_id: m1.id, viewer_id: v2.id, showtime: "7:00pm", price: 12.00, location: "Katy"})
t2 = Ticket.create({seats: 2, movie_name: m2.title, movie_id: m2.id, viewer_id: v1.id, showtime: "8:00pm", price: 13.00, location: "Downtown"})
t3 = Ticket.create({seats: 3, movie_name: m3.title, movie_id: m3.id, viewer_id: v2.id, showtime: "9:00pm", price: 13.00, location: "Galveston"})
t12 = Ticket.create({seats: 3, movie_name: m5.title, movie_id: m5.id, viewer_id: v1.id, showtime: "8:00pm", price: 13.00, location: "Spring"})
t4 = Ticket.create({seats: 1, movie_name: m4.title, movie_id: m4.id, viewer_id: v1.id, showtime: "10:00pm",price: 13.00, location: "Katy"})
t5 = Ticket.create({seats: 4, movie_name: m5.title, movie_id: m5.id, viewer_id: v2.id, showtime: "7:00pm", price: 13.00, location: "Downtown"})
t6 = Ticket.create({seats: 1, movie_name: m6.title, movie_id: m6.id, viewer_id: v1.id, showtime: "8:00pm", price: 13.00, location: "Galveston"})
t13 = Ticket.create({seats: 3, movie_name: m1.title, movie_id: m1.id, viewer_id: v2.id, showtime: "10:00pm", price: 13.00, location: "Spring"})
t7 = Ticket.create({seats: 2, movie_name: m7.title, movie_id: m7.id, viewer_id: v2.id, showtime: "9:00pm", price: 13.00, location: "Katy"})
t8 = Ticket.create({seats: 1, movie_name: m1.title, movie_id: m1.id, viewer_id: v1.id, showtime: "10:00pm", price: 13.00, location: "Downtown"})
t9 = Ticket.create({seats: 2, movie_name: m2.title, movie_id: m2.id, viewer_id: v2.id, showtime: "7:00pm", price: 13.00, location: "Galveston"})
t10 = Ticket.create({seats: 3, movie_name: m3.title, movie_id: m3.id, viewer_id: v1.id, showtime: "8:00pm", price: 13.00, location: "Spring"})
t11 = Ticket.create({seats: 3, movie_name: m4.title, movie_id: m4.id, viewer_id: v2.id, showtime: "9:00pm", price: 13.00, location: "Galveston"})