class CreateRegistrantWorkshops < ActiveRecord::Migration[5.0]
  def change
    create_table :registrant_workshops do |t|
      t.integer :registrant_id
      t.integer :workshop_id

      t.timestamps
    end
  end
end
