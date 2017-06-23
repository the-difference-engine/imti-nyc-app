class WorkExperience < ApplicationRecord
	validates :employer, :occupation, :start_date, :end_date, presence: true
  belongs_to :application

  def pretty_start_date
    start_date.strftime("%m/%d/%Y")
  end

  def pretty_end_date
    end_date.strftime("%m/%d/%Y")
  end
end
