class WorkExperience < ApplicationRecord
	validates :employer, :occupation, :start_date, :end_date, presence: true

  belongs_to :application

end
