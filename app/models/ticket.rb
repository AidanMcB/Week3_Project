class Ticket < ActiveRecord::Base
    belongs_to(:viewer)
    belongs_to(:movie)

    # def self.seats
    #     #?
    #     self.all.select do |seat|
    #         seat
    #     end
    # end
end