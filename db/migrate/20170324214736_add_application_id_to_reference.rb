class AddApplicationIdToReference < ActiveRecord::Migration[5.0]
  def change
    add_column :references, :application_id, :integer
  end
end
