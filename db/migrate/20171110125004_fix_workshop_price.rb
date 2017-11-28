class FixWorkshopPrice < ActiveRecord::Migration[5.0]
  def up
    change_column :workshops, :price, 'integer USING CAST(price AS integer)'
    add_column :charges, :registrant_id, :integer
    add_column :registrants, :paid, :boolean, default: false
  end

  def down
    change_column :workshops, :price, :string
    remove_column :charges, :registrant_id
    remove_column :registrants, :paid
  end
end
