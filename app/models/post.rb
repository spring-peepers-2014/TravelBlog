class Post < ActiveRecord::Base
  belongs_to :location_pin

  validates :location_pin, :presence => true

  validates :title, length: { maximum: 75,
    too_long: "%{count} characters is the maximum allowed" }
  validates :body, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }
end
