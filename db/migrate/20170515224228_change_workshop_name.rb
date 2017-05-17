class ChangeWorkshopName < ActiveRecord::Migration[5.0]
  def change
    rename_table :workshops, :registrants
  end
end
