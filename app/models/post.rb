class Post < ActiveRecord::Base
  belongs_to :location_pin

  validates :location_pin, :presence => true
  validates :title, presence: true, length: { maximum: 75,
    too_long: "%{count} characters is the maximum allowed" }
  validates :body, presence: true, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }

  # What hte ever-loving heck is this?  A post in a trip is hinged on a
  # location_pin?  OK, you've got a bad design and you're digging deeper.  Stop
  # and fix.  NOW.
    def trip
      self.location_pin.trip
    end
end
