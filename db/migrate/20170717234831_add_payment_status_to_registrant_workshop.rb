class AddPaymentStatusToRegistrantWorkshop < ActiveRecord::Migration[5.0]
  def change
    add_column :registrant_workshops, :payment_status, :boolean
  end
end
