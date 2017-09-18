FactoryGirl.define do
  factory :event do
    title {Faker::Company.catch_phrase}	
    location {Faker::GameOfThrones.city}
    start_time {Faker::Time.between(DateTime.now + 1, DateTime.now + 2)}
    end_time {Faker::Time.between(DateTime.now + 2, DateTime.now + 3)}
    details {Faker::Company.bs}
  end
end
