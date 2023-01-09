class Reservation < ApplicationRecord
    validates :user_id, :listing_id, :check_in_date, :check_out_date, :num_guests, :price, presence: true
  
    belongs_to :guest,
      foreign_key: :user_id,
      class_name: :User
  
    belongs_to :listing,
      foreign_key: :listing_id,
      class_name: :Listing
  
    has_one :host,
      through: :listing,
      source: :host
end
