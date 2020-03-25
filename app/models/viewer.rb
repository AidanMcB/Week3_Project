class Viewer < ActiveRecord::Base
    has_many(:tickets)
    has_many(:movies, through: :tickets)


    def self.find_viewer(name)
        self.all.find_by name: (name)
    end

end