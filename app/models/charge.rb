class Charge < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  belongs_to :user, optional: true
  validates :uid, :amount, :customer_id, :charge_type, presence: true
  validates :charge_type, inclusion: { in: %w(application course donation  workshop) }
end
