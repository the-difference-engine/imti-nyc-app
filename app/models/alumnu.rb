class Alumnu < ApplicationRecord
  belongs_to :user
  validates :street, :city, :state, :zip_code, :country, :birth_date, :graduation_year, presence: true
end
