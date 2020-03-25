require_relative "./config/environment.rb"

ActiveRecord::Base.logger = nil 

Application.welcome_user
PickAMovie.how_to_pick_a_movie

