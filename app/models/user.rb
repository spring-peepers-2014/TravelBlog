class User < ActiveRecord::Base
	has_many :trips
  has_many :location_pins, through: :trips
  has_many :posts, through: :trips
  has_many :photos, through: :trips
end
