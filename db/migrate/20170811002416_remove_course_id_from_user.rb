class RemoveCourseIdFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :course_id, :integer
  end
end
