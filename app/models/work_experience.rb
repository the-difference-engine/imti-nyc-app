class WorkExperience < ApplicationRecord
	validates :employer, :occupation, :start_date, presence: true
  validates :end_date, presence: true, :unless => :current_job?
	belongs_to :application
  
  def current_job(answer)
    @answer = answer == 'on' ? true : false
  end

  def current_job?
    @answer
  end 
end
