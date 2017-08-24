class Donation < ApplicationRecord
  validates :amount, presence: true
  belongs_to :user, optional: true
end
