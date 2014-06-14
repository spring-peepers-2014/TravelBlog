FactoryGirl.define do
  factory :post do
    # association :location_pin
    location_pin_id 1
    title "Bama Fever"
    body "Good times in AL!"
  end
end