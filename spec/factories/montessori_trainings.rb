FactoryGirl.define do
  factory :montessori_training do
    association :application
    name "JFC Training"
    location "NYC"
    diploma "BA"
    degree "teaching"
    degree_date "2014-07-13"
    experience true
  end
end
