class User < ApplicationRecord
  attr_reader :password
  
  validates :first_name, :last_name, :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  validates :email, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}
  validates :password, length: { minimum: 6 }, allow_nil: true
  
  has_one_attached :profile_photo, dependent: :destroy
  
  has_many :listings,
    foreign_key: :host_id,
    class_name: :Listing

  has_many :reservations, 
    foreign_key: :user_id,
    class_name: :Reservation,
    dependent: :destroy

  has_many :hosted_reservations,
    through: :listings,
    source: :reservations

  has_many :reviews,
    foreign_key: :reviewer_id,
    class_name: :Review,
    dependent: :destroy

  # SPIRE
  after_initialize :ensure_session_token

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user && user.is_password?(password) ? user : nil
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end
  
  private

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end
  
end
