class Charge < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  belongs_to :user, optional: true
  validates :uid, :amount, :customer_id, presence: true

  def dollar_amount
    number_to_currency(amount/100)
  end
end