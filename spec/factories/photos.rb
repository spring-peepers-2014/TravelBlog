require 'faker'

FactoryGirl.define do
  factory :photo do
    url "https://imgur.com/gallery/3ydlbVW"
    association :location_pin
  end
end