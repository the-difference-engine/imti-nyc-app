FactoryGirl.define do
  factory :user do 
    first_name "John"
     last_name "Smith"
     email "js@email.com"
     # course_id course.id
     password "password"
  end 
end
