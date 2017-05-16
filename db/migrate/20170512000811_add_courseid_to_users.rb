class AddCourseidToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :course_id, :integer
  end
end
