class Donation < ApplicationRecord
  validates :first_name, :last_name, :email, :amount, presence: true
end
