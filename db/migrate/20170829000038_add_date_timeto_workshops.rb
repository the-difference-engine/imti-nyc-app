class AddDateTimetoWorkshops < ActiveRecord::Migration[5.0]
  def change
    remove_column :workshops, :date, :string
    add_column :workshops, :date, :datetime
  end
end
