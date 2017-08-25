class Donation < ApplicationRecord
  validates :amount, presence: true
  belongs_to :user, optional: true

  MINIMUN_AMOUNT = 5

  def to_param
    uid
  end
  
end
