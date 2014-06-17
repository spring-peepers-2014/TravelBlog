FactoryGirl.define do
  factory :location do
    name { Faker::Address.city }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
