
class FixWorkshopPrice < ActiveRecord::Migration[5.0]
  def up
    remove_column :workshops, :price
    add_column :workshops, :price, :decimal, precision: 15, scale: 2
    add_column :charges, :registrant_id, :integer
    add_column :registrants, :paid, :boolean, default: false
  end

  def down
    remove_column :workshops, :price
    add_column :workshops, :price, :string
    remove_column :charges, :registrant_id
    remove_column :registrants, :paid
  end
end