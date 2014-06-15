class Location < ActiveRecord::Base
  has_many :location_pins
  has_many :trips, through: :location_pins

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :name, presence: true
end
