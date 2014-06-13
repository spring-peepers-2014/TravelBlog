class LocationPin < ActiveRecord::Base
  belongs_to :map
  belongs_to :trip
  has_many :photos
  has_many :posts
end
