FactoryGirl.define do

p "defining user, education, and application factories"

  factory :user do
    email "no@way.com"
    password "jsrulez"
    first_name "Putito"
    last_name "Makiyo"
  end

  factory :education do
    association :application
    school "My School"
    location "No where"
    start_date "2017-06-8 19:36:36"
    end_date "2017-06-10 19:36:36"
    degree "Being so rad"
    degree_date "2017-06-11 19:36:36"
  end

  factory :application do
    association :user
    street "williams st"
    city "williamsburg"
    state "New York"
    country "USA"
    zip_code "11206"
    phone_number "111-234-2835"
    payment_status true
    background_check true
    application_status "complete"
    resume "sdfadsvxczv"
    health_form "sdvzxcvcxz"
    personal_essay "dsvzxcvzxc"
    toefl_score "345"
    name_of_spouse "Milly Molly"
    birth_place "Washington DC"
    birth_date "1998-06-8 19:36:36"
    country_of_citizenship "USA"
    occupation "Teacher"
    ages_of_children "2"
  end
end
