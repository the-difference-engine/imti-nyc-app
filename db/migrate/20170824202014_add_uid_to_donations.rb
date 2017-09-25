class AddUidToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :uid, :string
  end
end
