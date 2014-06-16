class Post < ActiveRecord::Base
  belongs_to :location_pin

  validates :location_pin, :presence => true
  validates :title, presence: true, length: { maximum: 75,
    too_long: "%{count} characters is the maximum allowed" }
  validates :body, presence: true, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }

    def trip
      self.location_pin.trip
    end
end
