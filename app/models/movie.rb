class Movie < ActiveRecord::Base
    has_many(:tickets)
    has_many(:viewers, through: :tickets)


    def self.movie_titles
        self.all.map {|movie| movie.title}
    end
<<<<<<< HEAD
=======

    def self.movie_genres
        self.all.map {|movie| movie.genre}
    end

    def self.movie_ratings
        self.all.map{|movie| movie.rating}
    end
>>>>>>> Aidan
end