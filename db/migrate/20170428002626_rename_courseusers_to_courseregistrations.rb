class RenameCourseusersToCourseregistrations < ActiveRecord::Migration[5.0]
  def self.up
  	rename_table :course_users, :course_registrations
  end

  def self.down
  	rename_table :course_registrations, :course_users
  end
end
