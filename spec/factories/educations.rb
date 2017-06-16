require 'date'

FactoryGirl.define do

  factory :user do
    # id {  }
    email { Faker::Internet.email}
    # encrypted_password { "wifnqwejvnew" }
    password { "password" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end

  factory :application do
    association :user
    # id { 5 }
    # user_id { 5 }
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    country { Faker::Address.country }
    zip_code { Faker::Address.zip }
    phone_number { Faker::PhoneNumber.cell_phone }
  end

  factory :education do
    association :application
    # application_id { 5 }
    school { Faker::Educator.secondary_school }
    location { Faker::Educator.campus }
    start_date { Date.new(2001, 01, 01) }
    end_date { Date.new(2008, 05, 30) }
    degree { Faker::Educator.course }
    degree_date { Date.new(2008, 06, 01) }

    after(:build) do |education|
      application = build(:application)
      application.educations << education
      user = build(:user)
      user.application = application 
    end 
  end
end
