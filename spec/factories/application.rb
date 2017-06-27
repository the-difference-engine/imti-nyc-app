require 'date'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end

  factory :application do
    association :user
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

  factory :education do
    association :application
    school { Faker::Educator.secondary_school }
    location { Faker::Educator.campus }
    start_date { Date.new(2001, 01, 01) }
    end_date { Date.new(2008, 05, 30) }
    degree { Faker::Educator.course }
    degree_date { Date.new(2008, 06, 01) }
  end

  # # unused reference factory
  # factory :reference do
  #   association :application
  #   name { Faker::Name.first_name }
  #   address { Faker::Address.street_address }
  #   position { Faker::Job.title }
  # end

  # # unused montessori training factory
  # factory :montessori_training do
  #   association :application
  #   name { Faker::Name.first_name }
  #   location { Faker::Address.city }
  #   diploma { Faker::Educator.course }
  #   degree { Faker::Educator.university }
  #   degree_date { Date.new(2017, 01, 01) }
  # end

  # # unused work experience
  # factory :work_experience do
  #   association :application   
  #   employer { Faker::Company.name }
  #   occupation { Faker::Company.profession }
  #   start_date { Date.new(2016, 01, 01) }
  #   end_date { Date.new(2017, 01, 01) }
  # end

end
