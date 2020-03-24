class Movie < ActiveRecord::Base
    has_many(:tickets)
    has_many(:viewers, through: :tickets)


    def self.movie_titles
        self.all.map {|movie| movie.title}
    end
end