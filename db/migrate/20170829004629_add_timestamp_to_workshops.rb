class AddTimestampToWorkshops < ActiveRecord::Migration[5.0]
  def change
    add_column :workshops, :time, :timestamp
  end
end
