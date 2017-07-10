FactoryGirl.define do
  factory :work_experience do
    association :application
    employer Faker::Company.name
    occupation Faker::Job.title
    start_date '2004-06-22'
    end_date '2016-06-22'

    factory :invalid_work_experience do
      employer nil
    end
  end
end
