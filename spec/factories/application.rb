require 'date'

FactoryGirl.define do
  factory :application do
    association :user
    association :document
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    country { Faker::Address.country }
    zip_code { Faker::Address.zip }
    phone_number { Faker::PhoneNumber.cell_phone }
    birth_place { Faker::Address.country }
    birth_date { Date.new(2001, 01, 01) }
    country_of_citizenship { Faker::Address.country }
    occupation { Faker::Job.title }
  end
end
