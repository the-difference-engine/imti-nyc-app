class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.string :details

      t.timestamps
    end
  end
end
