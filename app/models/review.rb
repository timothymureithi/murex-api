class Review < ApplicationRecord
    validates :rating, inclusion: {in: (1..5)}
    validates :user_id, :proerty_id, :body, :rating, presence: true
  
    belongs_to :property
    belongs_to :user
end
