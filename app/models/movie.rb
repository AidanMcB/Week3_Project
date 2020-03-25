class Movie < ActiveRecord::Base
    has_many(:tickets)
    has_many(:viewers, through: :tickets)


    def self.titles
        self.all.map {|movie| movie.title}
    end
  
    def self.genres
        self.all.map {|movie| movie.genre}
    end

<<<<<<< HEAD
    def self.ratings
        self.all.map{|movie| movie.rating}
    end


=======
>>>>>>> Aidan
    def self.locations
        self.all.map{|movie| movie.location}
    end

    def self.runtimes(min, max)
        self.all.select {|movie| movie.runtime >= min && movie.runtime <= max}
    end

<<<<<<< HEAD
=======
    def self.ratings(min, max)
        self.all.select {|movie| movie.rating >= min && movie.rating <= max}
    end
>>>>>>> Aidan
end