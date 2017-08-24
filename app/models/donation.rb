class Donation < ApplicationRecord
  validates :amount, presence: true
  belongs_to :user, optional: true
  def to_param
    uid
  end
end
