class Donation < ApplicationRecord
  validates :amount, presence: true
end
