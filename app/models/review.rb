class Review < ApplicationRecord
    validates :reviewer_id, :listing_id, :message, presence: true
  
    validates :cleanliness, :accuracy, :communication, :check_in, :value, :location, presence: true, inclusion: { in: (1..5) }
  
    belongs_to :reviewer,
      foreign_key: :reviewer_id,
      class_name: :User
  
    belongs_to :listing,
      foreign_key: :listing_id,
      class_name: :Listing
  end