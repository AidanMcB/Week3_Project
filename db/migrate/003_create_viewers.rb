class CreateViewers < ActiveRecord::Migration[5.2]
    def change
        create_table :viewers do |t|
            t.string :name
            t.string :email_address
            t.string :payment_option
        end
    end
end