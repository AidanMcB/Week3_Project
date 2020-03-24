class Movie < ActiveRecord::Base
    has_many(:tickets)
    has_many(:viewers, through: :tickets)
end