class Ticket < ActiveRecord::Base
    belongs_to(:viewer)
    belongs_to(:movie)

end