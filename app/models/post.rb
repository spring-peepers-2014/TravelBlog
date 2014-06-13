class Post < ActiveRecord::Base
  belongs_to :location_pin
  belongs_to :trip

  validates :location_pin, :presence => true
  validates :trip, :presence => true
end
