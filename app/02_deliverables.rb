class PickAMovie < ActiveRecord::Base

    @@movie = nil
    #classs varioable
    @@viewer = Application.call_current_viewer


    #inside of a method 
    # viewer = Application.call_current_viewer

end