require 'faker'

FactoryGirl.define do
  factory :post do
    title "Bama Fever"
    body "Good times in AL!"
    association :location_pin
  end
end
