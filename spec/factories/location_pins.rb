require 'faker'

FactoryGirl.define do
  factory :location_pin do
    association :location
    association :trip
  end
end
