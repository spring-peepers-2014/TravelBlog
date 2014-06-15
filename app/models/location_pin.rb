class LocationPin < ActiveRecord::Base
  # belongs_to :map
  belongs_to :trip
  belongs_to :location
  has_many :photos, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :trip, presence: true
  validates :location, presence: true
end
