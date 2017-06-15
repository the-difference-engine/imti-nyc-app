class ChangePaymentStatusDefaultToFalse < ActiveRecord::Migration[5.0]
  def change
    change_column :registrant_workshops, :payment_status, :boolean, :default => false
  end
end
