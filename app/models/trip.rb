class Trip < ActiveRecord::Base
  belongs_to :user

  # Wait so a location is modeled as being a side-effect of
  # a location pin?  When I was a child, I had a map of the US
  # and every place my family went I could put a pin of that trip on my wall.
  # It was great.  So you mean to tell me that those cities did not exist until
  # I put a pin in my wall-mounted map?  Astounding!
  #
  # That's screwed up.
  has_many :location_pins, dependent: :destroy
  has_many :locations, through: :location_pins
  has_many :photos, through: :location_pins # not implemented, don't commit
  has_many :posts, through: :location_pins

  validates :user, :presence => true
  validates :title, :presence => true
end
