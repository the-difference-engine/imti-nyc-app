class Application < ApplicationRecord
  # validates :phone_number, :street, :city, :state, :zip_code, :country, :birth_place, :birth_date,
  #           :country_of_citizenship, :occupation, presence: true
  has_many :transcripts, -> { where 'category = transcript' }, class_name: 'Document'
  has_many :recommendations, -> { where 'category = recommendation' }, class_name: 'Document'
  has_many :resume, -> { where 'category = resume' }, class_name: 'Document'
  has_many :references
  has_many :educations
  has_many :montessori_trainings
  has_many :documents
  has_many :work_experiences
  belongs_to :user
end
