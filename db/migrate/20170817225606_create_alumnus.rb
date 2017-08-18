class CreateAlumnus < ActiveRecord::Migration[5.0]
  def change
    create_table :alumnus do |t|
      t.integer :user_id
      t.string :home_phone
      t.string :mobile_phone
      t.string :work_phone
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.datetime :birth_date
      t.integer :graduation_year
      t.string :occupation
      t.text :bio

      t.timestamps
    end
  end
end
