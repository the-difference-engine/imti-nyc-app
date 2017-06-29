require 'date'

FactoryGirl.define do
  factory :education do
    association :application
    school { Faker::Educator.secondary_school }
    location { Faker::Educator.campus }
    start_date { Date.new(2001, 01, 01) }
    end_date { Date.new(2008, 05, 30) }
    degree { Faker::Educator.course }
    degree_date { Date.new(2008, 06, 01) }
  end
end
