class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :price, precision: 7, scale: 2
      t.text :description
      t.string :lecturer

      t.timestamps
    end
  end
end
