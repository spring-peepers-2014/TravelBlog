require 'faker'

FactoryGirl.define do
  factory :trip do
    title { Faker::Lorem.sentence }
    association :user
  end
end
