class AddChargeType < ActiveRecord::Migration[5.0]
  def change
    add_column :charges, :charge_type, :string
    add_column :charges, :email, :string
  end
end
