class PickAMovie < ActiveRecord::Base

    @@movie = nil

    
    viewer = Application.call_current_viewer

end