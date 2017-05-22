class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
