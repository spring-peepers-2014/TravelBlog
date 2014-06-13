class Photo < ActiveRecord::Base
  belongs_to :location_pin
  belongs_to :trip
end
