FactoryGirl.define do
  factory :reference do
    association :application
    name Faker::Name.name
    address Faker::Address.street_address
    position Faker::Job.title
  end
end
