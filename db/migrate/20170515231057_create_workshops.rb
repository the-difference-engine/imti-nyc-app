class CreateWorkshops < ActiveRecord::Migration[5.0]
  def change
    create_table :workshops do |t|

      t.timestamps
    end
  end
end
