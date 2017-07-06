FactoryGirl.define do
  factory :document do 
    association :application
    category "health_form"
    attachment_file_name "1099CompositeandYearEndSummary20160210176928.pdf"
    attachment_file_size 73764
    attachment_content_type "application/pdf"
  end
end
