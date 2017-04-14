class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
      t.string :uid
      t.integer :user_id
      t.decimal :amount, precision: 8, scale: 2
      t.string :customer_id
      t.string :description

      t.timestamps
    end
  end
end
