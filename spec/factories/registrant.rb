FactoryGirl.define do
  factory :registrant do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    affiliation 'aaa'
    occupation 'bbb'
    email Faker::Internet.email
    phone Faker::PhoneNumber.phone_number
  end
end
