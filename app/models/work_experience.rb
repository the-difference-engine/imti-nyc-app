class WorkExperience < ApplicationRecord
	validates :employer, :occupation, :start_date, presence: true
  validates :end_date, presence: true, :unless => :current_job?
	belongs_to :application
  
end
