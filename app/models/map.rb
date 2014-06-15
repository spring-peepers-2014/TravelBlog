class Map < ActiveRecord::Base
  belongs_to :user
  has_many :location_pins, dependent: :destroy
end
