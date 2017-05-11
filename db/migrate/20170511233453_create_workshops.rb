class CreateWorkshops < ActiveRecord::Migration[5.0]
  def change
    create_table :workshops do |t|
      t.string :first_name
      t.string :last_name
      t.string :affiliation
      t.string :occupation
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
