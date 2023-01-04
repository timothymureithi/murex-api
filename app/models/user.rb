class User < ApplicationRecord
    has_many :bookings 
    has_many :properties
    has_many :reviews, dependent: :destroy
    has_many :bookings_as_owner, through: :properties, source: :bookings

end
