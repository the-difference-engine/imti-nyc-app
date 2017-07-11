class Application < ApplicationRecord

  validates :phone_number, :street, :city, :state, :zip_code, :country, :birth_place, :birth_date, :country_of_citizenship, :occupation, presence: true
  has_many :transcripts, -> { where 'category = transcript' }, class_name: 'Document'

  has_many :recommendations, -> { where 'category = recommendation' }, class_name: 'Document'
  has_many :resumes, -> { where 'category = resume' }, class_name: 'Document'
  has_many :personal_essays, -> { where 'category = personal_essay' }, class_name: 'Document'
  has_many :health_forms, -> { where 'category = health_form' }, class_name: 'Document'
  has_many :toefl_ielts_score_reports, -> { where 'category = toefl_ielts_score_report' }, class_name: 'Document'
  has_one :passport_photo, -> { where 'category = passport_photo' }, class_name: 'Document'
  has_one :wes_evaluation, -> { where 'category = wes_evaluation' }, class_name: 'Document'
  has_one :contract, -> { where 'category = contract' }, class_name: 'Document'
  has_one :student_visa, -> { where 'category = student_visa' }, class_name: 'Document'
  has_many :references
  has_many :educations
  has_many :montessori_trainings
  has_many :documents
  has_many :work_experiences
  belongs_to :user

  accepts_nested_attributes_for :documents

  def pretty_date(date)
    if date
      date.strftime("%m/%d/%Y")
    end
  end
  
end
