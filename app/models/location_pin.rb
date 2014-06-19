class LocationPin < ActiveRecord::Base
  belongs_to :trip
  belongs_to :location
  has_many :posts, dependent: :destroy

  validates :trip, presence: true
  validates :location, presence: true

  def coords
    location = self.location
    coords = { lat: location.latitude, lon: location.longitude }
  end

  def name
    self.location.name
  end
end
