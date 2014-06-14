FactoryGirl.define do
  factory :post do
    association :location_pin
    title "Bama Fever"
    body "Good times in AL!"
  end
end