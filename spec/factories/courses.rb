FactoryGirl.define do
  factory :user do 
    first_name "John"
     last_name "Smith"
     email "js@email.com"
     # course_id course.id
     password "password"
  end 

  factory :course do
    name "Summer"
    start_date "04/04/2017"
    end_date "06/06/2017"
    description "Summer class"
    price 400.00
    lecturer Faker::Name.name
  end
end
