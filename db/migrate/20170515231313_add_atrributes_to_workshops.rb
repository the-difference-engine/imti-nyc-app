class AddAtrributesToWorkshops < ActiveRecord::Migration[5.0]
  def change
    add_column :workshops, :name, :string
    add_column :workshops, :description, :string
    add_column :workshops, :date, :string
    add_column :workshops, :price, :string
  end
end
