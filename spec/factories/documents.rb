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
  end

  factory :document do 
    association :application
    category "health_form"
    attachment_file_name "1099CompositeandYearEndSummary20160210176928.pdf"
    attachment_file_size 73764
    attachment_content_type "application/pdf"
  end
end
