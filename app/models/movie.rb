class Movie < ActiveRecord::Base
    has_many(:tickets)
    has_many(:viewers, through: :tickets)


    def self.titles
        self.all.map {|movie| movie.title}
    end
  
    def self.genres
        self.all.map {|movie| movie.genre}
    end

    def self.ratings
        self.all.map{|movie| movie.rating}
    end


    def self.locations
        Ticket.all.map{|ticket| ticket.location}
    end

    def self.runtimes
        movies1 = Movie.all.sort_by{|movie| movie.runtime}
        movies = movies1.map {|movie| "#{movie.title}," + " " +  "#{movie.runtime.to_s}" + " minutes"}

    end

    def self.ratings(min, max)
        rating = self.all.select {|movie| movie.rating >= min && movie.rating <= max}
        rating.map {|movie| "#{movie.title}" + ", " +  "#{movie.rating.to_s}" + " out of 10" }
    end

end

