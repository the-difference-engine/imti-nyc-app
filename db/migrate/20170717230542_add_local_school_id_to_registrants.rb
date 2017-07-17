class AddLocalSchoolIdToRegistrants < ActiveRecord::Migration[5.0]
  def change
    add_column :registrants, :local_school_id, :integer
  end
end
