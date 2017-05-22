class CreateRegistrantWorkshops < ActiveRecord::Migration[5.0]
  def change
    create_table :registrant_workshops do |t|
      t.string :registrant_id
      t.string :workshop_id

      t.timestamps
    end
  end
end
