require 'date'

FactoryGirl.define do

  factory :user do
    email { Faker::Internet.email }
    password { "password" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end

  factory :application do
    association :user
    association :document
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    country { Faker::Address.country }
    zip_code { Faker::Address.zip }
    phone_number { Faker::PhoneNumber.cell_phone }
    birth_place { Faker::Address.country }
    birth_date { Date.new(2017, 01, 01) }
    country_of_citizenship { Faker::Address.country }
    occupation { Faker::Job.title }


    after(:build) do |application|
      
      # application.educations << build(:educations)
      # application.references << build(:references)
      # application.montessori_trainings << build(:montessori_trainings)
      # application.educations << build(:education)
      # application.educations << build(:education)
      document = build(:document)
      application.documents << document
      user = build(:user)
      user.application = application
    end 

  end

  factory :reference do 
    association :application
    name { Faker::Name.first_name }
    address { Faker::Address.street_address }
    position { Faker::Job.title }
  end


  factory :montessori_training do 
    association :application
    name { Faker::Name.first_name }
    location { Faker::Address.city }
    diploma { Faker::Educator.course }
    degree { Faker::Educator.university }
    degree_date { Date.new(2017, 01, 01) }
  end

  factory :document do 
    association :application         
    category 'transcript'
    attachment_file_name { Faker::File.file_name }
    attachment_file_size 123
    attachment_content_type { Faker::File.extension }
    attachment_updated_at { Date.new(2016, 01, 01) }

    # after(:build) do |document|
    #   application = build(:application)
    #   application.documents << document
    #   user = build(:user)
    #   user.application = application
    # end 



  end

  # factory :recommendation_document do 
  #   association :application         
  #   category 'recommendation'
  #   attachment_file_name { Faker::File.file_name }
  #   attachment_file_size 123
  #   attachment_content_type { Faker::File.extension }
  #   attachment_updated_at { Date.new(2016, 01, 01) }
  # end

  # factory :resume_document do 
  #   association :application         
  #   category 'resume'
  #   attachment_file_name { Faker::File.file_name }
  #   attachment_file_size 123
  #   attachment_content_type { Faker::File.extension }
  #   attachment_updated_at { Date.new(2016, 01, 01) }
  # end

  # factory :personal_essay_document do 
  #   association :application         
  #   category 'personal_essay'
  #   attachment_file_name { Faker::File.file_name }
  #   attachment_file_size 123
  #   attachment_content_type { Faker::File.extension }
  #   attachment_updated_at { Date.new(2016, 01, 01) }
  # end

  # factory :health_form_document do 
  #   association :application         
  #   category 'health_form'
  #   attachment_file_name { Faker::File.file_name }
  #   attachment_file_size 123
  #   attachment_content_type { Faker::File.extension }
  #   attachment_updated_at { Date.new(2016, 01, 01) }
  # end

  # factory :toefl_ielts_score_report_document do 
  #   association :application         
  #   category 'toefl_ielts_score_report'
  #   attachment_file_name { Faker::File.file_name }
  #   attachment_file_size 123
  #   attachment_content_type { Faker::File.extension }
  #   attachment_updated_at { Date.new(2016, 01, 01) }
  # end

  # factory :passport_photo_document do 
  #   association :application         
  #   category 'passport_photo'
  #   attachment_file_name { Faker::File.file_name }
  #   attachment_file_size 123
  #   attachment_content_type { Faker::File.extension }
  #   attachment_updated_at { Date.new(2016, 01, 01) }
  # end

  # factory :wes_evaluation_document do 
  #   association :application         
  #   category 'wes_evaluation'
  #   attachment_file_name { Faker::File.file_name }
  #   attachment_file_size 123
  #   attachment_content_type { Faker::File.extension }
  #   attachment_updated_at { Date.new(2016, 01, 01) }
  # end

  # factory :student_visa_document do 
  #   association :application         
  #   category 'student_visa'
  #   attachment_file_name { Faker::File.file_name }
  #   attachment_file_size 123
  #   attachment_content_type { Faker::File.extension }
  #   attachment_updated_at { Date.new(2016, 01, 01) }
  # end

  factory :work_experience do 
    association :application         
    employer { Faker::Company.name }
    occupation { Faker::Company.profession }
    start_date { Date.new(2016, 01, 01) }
    end_date { Date.new(2017, 01, 01) }
  end

  factory :education do
    association :application
    school { Faker::Educator.secondary_school }
    location { Faker::Educator.campus }
    start_date { Date.new(2001, 01, 01) }
    end_date { Date.new(2008, 05, 30) }
    degree { Faker::Educator.course }
    degree_date { Date.new(2008, 06, 01) }

    after(:build) do |education|
      application = build(:application)
      application.educations << education
      user = build(:user)
      user.application = application
    end 

  end
end