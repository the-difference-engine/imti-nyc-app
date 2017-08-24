class Charge < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  belongs_to :user, optional: true
  validates :uid, :amount, :customer_id, presence: true
  def to_param
    uid
  end
end