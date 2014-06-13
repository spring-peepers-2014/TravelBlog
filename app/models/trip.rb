class Trip < ActiveRecord::Base
  belongs_to :user
	has_many :posts
  has_many :location_pins
  has_many :photos
  has_many :photos, through: :location_pins
  has_many :posts, through: :location_pins
end
