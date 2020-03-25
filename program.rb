require_relative "./config/environment.rb"

ActiveRecord::Base.logger = nil 
Application.welcome_user
Application.how_to_pick_a_movie(Application.call_current_viewer)

#Deliverables.method
