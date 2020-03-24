class CreateMovies < ActiveRecord::Migration[5.2]
    def change
        create_table :movies do |t|
            t.string :title
            t.float :rating
            t.string :actors
            t.float :runtime
            t.string :genre
        end
    end
end 