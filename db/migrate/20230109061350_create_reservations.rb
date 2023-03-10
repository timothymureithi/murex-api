class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id, null: false, index: true
      t.integer :listing_id, null: false, index: true
      t.date :check_in_date, null: false
      t.date :check_out_date, null: false
      t.integer :num_guests, null: false
      t.float :price, null: false
      t.timestamps
    end
  end
end
