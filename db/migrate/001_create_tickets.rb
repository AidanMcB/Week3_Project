class CreateTickets < ActiveRecord::Migration[5.2]
    def change
        create_table :tickets do |t|
            t.integer :seats
            t.string :showtime
            t.string :price
            t.string :location
            t.integer :movie_id
            t.integer :viewer_id

        end
    end
end