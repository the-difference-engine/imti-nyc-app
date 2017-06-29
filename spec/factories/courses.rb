FactoryGirl.define do
  factory :course do
    name "Summer"
    start_date "04/04/2017"
    end_date "06/06/2017"
    description "Summer class"
    price 400.00
    lecturer Faker::Name.name
  end
end
