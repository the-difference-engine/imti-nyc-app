FactoryGirl.define do
  factory :event do
    title {Faker::Company.catch_phrase}	
    location {Faker::GameOfThrones.city}
    start_time {Faker::Time.between(DateTime.now - 1, DateTime.now)}
    end_time {Faker::Time.between(DateTime.now + 1, DateTime.now)}
    details {Faker::Company.bs}
  end
end
