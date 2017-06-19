FactoryGirl.define do
  factory :education do
    association :application
    school "My School"
    location "No where"
    start_date "2017-06-8 19:36:36"
    end_date "2017-06-10 19:36:36"
    degree "Being so rad"
    degree_date "2017-06-11 19:36:36"
  end
end
