class AddAmountToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :amount, :decimal, :precision => 8, :scale => 2
  end
end
