class User < ApplicationRecord
    has_many :bookings 
    has_many :properties
    has_many :reviews, dependent: :destroy
    has_many :bookings_as_owner, through: :properties, source: :bookings

     # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

end
