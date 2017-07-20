FactoryGirl.define do 
  factory :user do 
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email "#{first_name}#{last_name}@email.com"
    password "password"
  end 
end