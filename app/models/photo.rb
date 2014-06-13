class Photo < ActiveRecord::Base
  belongs_to :location_pin

  validates :location_pin, :presence => true
end
