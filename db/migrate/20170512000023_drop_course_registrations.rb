class DropCourseRegistrations < ActiveRecord::Migration[5.0]
  def change
  	drop_table :course_registrations
  end
end
