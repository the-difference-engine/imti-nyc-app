class Education < ApplicationRecord
  validates :school, :location, :start_date, :end_date, :degree, :degree_date, presence: true
  belongs_to :application

  def pretty_date(date)
    if date
      date.strftime("%m/%d/%Y")
    end
  end
end
