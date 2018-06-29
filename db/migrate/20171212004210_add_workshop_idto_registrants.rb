
class AddWorkshopIdtoRegistrants < ActiveRecord::Migration[5.0]
  def change
    add_column :registrants, :workshop_id, :integer
  end
end