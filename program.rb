require_relative "./config/environment.rb"

ActiveRecord::Base.logger = nil 
Application.welcome_user

