FactoryGirl.define do
  factory :local_school do
    name Faker::Name.name
    contact_name Faker::Name.name
    school_address Faker::Address.street_address
    bio Faker::Lorem.sentence
  end
end
