class AddToDonationUserIdAndConfirmed < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :user_id, :integer
    add_column :donations, :confirmed, :boolean, :default => false
  end
end
