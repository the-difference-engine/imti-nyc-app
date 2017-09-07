FactoryGirl.define do
  factory :event do
    title {Faker::RickAndMorty.character}	
    location {Faker::RickAndMorty.location}
    start_time {Faker::Date.between(2.days.ago, 2.days.from_now, Date.today)}
    end_time {Faker::Date.between_except(3.days.from_now, 1.week.from_now, Date.today)}
    details {Faker::RickAndMorty.quote}
  end
end
