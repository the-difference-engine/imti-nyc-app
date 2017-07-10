FactoryGirl.define do
  factory :application do
    association :user
    street Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state
    country Faker::Address.country
    zip_code Faker::Address.zip
    phone_number Faker::PhoneNumber.cell_phone
    payment_status true
    background_check true
    application_status "complete"
    resume "sdfadsvxczv"
    health_form "sdvzxcvcxz"
    personal_essay "dsvzxcvzxc"
    toefl_score "345"
    name_of_spouse Faker::Name.name
    birth_place Faker::Address.city
    birth_date "1998-06-8 19:36:36"
    country_of_citizenship Faker::Address.country
    occupation "teacher"
    ages_of_children "2"
  end
end