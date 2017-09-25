# Charge description is the type of payment the user has been charge for
# payment_id is the id of the payment (e.g courses, donations, workshops) the user has been charge for.
class Charge < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  belongs_to :user, optional: true
  validates :uid, :amount, :customer_id, presence: true

  def to_param
    uid
  end

end