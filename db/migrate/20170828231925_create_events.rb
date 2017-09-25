class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.string :details

      t.timestamps
    end
  end
end
