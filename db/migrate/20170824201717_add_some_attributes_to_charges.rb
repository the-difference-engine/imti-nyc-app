class AddSomeAttributesToCharges < ActiveRecord::Migration[5.0]
  def change
    add_column :charges, :payment_id, :integer
    add_column :charges, :currency, :string
    add_column :charges, :card, :string
  end
end
