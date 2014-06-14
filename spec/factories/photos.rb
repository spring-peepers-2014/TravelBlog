FactoryGirl.define do
  factory :photo do
    association :location_pin
    url "https://imgur.com/gallery/3ydlbVW"
  end
end