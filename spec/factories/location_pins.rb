require 'faker'

FactoryGirl.define do
  factory :location_pin do
    location_name { Faker::Address.city }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    association :map
    association :trip
  end
end
