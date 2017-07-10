class WorkExperience < ApplicationRecord
  # validates :employer, :occupation, :start_date, :end_date, presence: true
  belongs_to :application

  def pretty_date(date)
    if date
      date.strftime("%m/%d/%Y")
    end
  end
end
