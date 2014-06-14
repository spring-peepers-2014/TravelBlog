require 'faker'

FactoryGirl.define do
  factory :trip do
    association :user
    title { Faker::Lorem.sentence }
  end
end