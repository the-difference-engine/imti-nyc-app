class Remove < ActiveRecord::Migration[5.0]
  def change
    remove_column :workshops, :date, :datetime
  end
end
