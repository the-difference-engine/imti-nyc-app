require "faker"

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "johndoe#{n}@example.com"}
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    password "password"
  end
end
