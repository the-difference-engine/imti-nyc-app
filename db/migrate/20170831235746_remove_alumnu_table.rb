class RemoveAlumnuTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :alumnus
  end
end
