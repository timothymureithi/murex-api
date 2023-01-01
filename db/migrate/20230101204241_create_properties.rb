class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :street
      t.string :city
      t.string :county
      t.string :postal_code
      t.integer :listing_id
      t.timestamps
    end
  end
end
