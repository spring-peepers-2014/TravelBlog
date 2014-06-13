class User < ActiveRecord::Base
	has_many :trips
  has_many :location_pins, through: :trips
  has_many :posts, through: :trips
  has_many :photos, through: :trips

  validates :email, presence: true, :uniqueness => true, :format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :password_digest, presence: true, :length => { :minimum => 6, :message => "must be at least 6 characters" }
end
