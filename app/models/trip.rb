class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :location_pins, dependent: :destroy
  has_many :locations, through: :location_pins
  has_many :posts, through: :location_pins

  validates :user, :presence => true
  validates :title, :presence => true
end
